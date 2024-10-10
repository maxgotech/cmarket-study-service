from fastapi import APIRouter, Depends, HTTPException
from app.core.session import get_db
from app.crud.studies import crud_study
from fastapi import status, Request
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from app.schemas.study import StudyOut, StudyCreate, StudyUpdate
from app.models.user import UserModel
import app.utils as utils
import asyncio
from app.kafka.producer import send_one

router = APIRouter(prefix="/studies", tags=["Studies"])


@router.get("/", response_model=list[StudyOut], status_code=status.HTTP_200_OK)
async def get_studies(
    request: Request,
    skip: int = 0,
    limit: int = 100,
    db: AsyncSession = Depends(get_db),
):
    """
    Get multiple studies
    """
    studies = await crud_study.get_multi(db, offset=skip, limit=limit)

    client_host = request.client
    asyncio.create_task(
        send_one(
            b"GET studies/",
            bytes(
                f"gathering studies by request from {client_host}",
                encoding="utf-8",
            ),
        )
    )
    return studies


@router.get("/{id}", response_model=StudyOut, status_code=status.HTTP_200_OK)
async def get_study(id: int, db: AsyncSession = Depends(get_db)):
    """
    Get specific study
    """
    study = await crud_study.get(db, id=id)
    if not study:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Study not found"
        )
    return study


@router.post("/", response_model=StudyOut, status_code=status.HTTP_201_CREATED)
async def create_study(study_in: StudyCreate, db: AsyncSession = Depends(get_db)):
    """
    Create study
    """
    # check if user exists
    # preferably this should be send to users service but i will keep this here
    # since services have different db instances if launched with docker
    # TODO(Maxim) need to create some kind of multirepo to start all services with single docker compose
    check_for_user = (
        (await db.execute(select(UserModel).where(UserModel.id == study_in.userid)))
        .scalars()
        .first()
    )

    if not check_for_user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="User not found"
        )

    # create study in db
    study = await crud_study.create(db, study_in)

    # TODO(Maxim) add update for kinescope folder after creation of study
    # create folders for future file uploads
    try:
        await asyncio.gather(
            utils.create_study_folder(study.id),
            utils.create_kinescope_folder(study.id),
        )
    except Exception as e:
        raise e

    return study


@router.patch("/", response_model=StudyOut, status_code=status.HTTP_200_OK)
async def update_study(study_in: StudyUpdate, db: AsyncSession = Depends(get_db)):
    """
    Update study
    """

    # if no id then we cant find the
    if study_in.id == None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Invalid body request"
        )

    # get study will raise 404 if no study is not found
    await get_study(study_in.id, db)

    return await crud_study.update(db, study_in)


@router.delete("/{id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_study(id: int, db: AsyncSession = Depends(get_db)):
    """
    Delete study
    """

    # get study will raise 404 if no study is not found
    await get_study(id, db)

    await crud_study.delete(db, id=id)
    
    return
