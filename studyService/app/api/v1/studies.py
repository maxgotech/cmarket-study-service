from fastapi import APIRouter, Depends, HTTPException
from app.core.session import get_db
from app.crud.studies import crud_study
from fastapi import status
from sqlalchemy.ext.asyncio import AsyncSession
from app.schemas.study import StudyOut, StudyCreate, StudyTest
import app.utils as utils
import asyncio

router = APIRouter(prefix="/studies", tags=["Studies"])


@router.get("/", response_model=list[StudyOut], status_code=status.HTTP_200_OK)
async def get_studies(
    skip: int = 0, limit: int = 100, db: AsyncSession = Depends(get_db)
):
    """
    Get multiple studies
    """
    studies = await crud_study.get_multi(db, offset=skip, limit=limit)
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


@router.post("/")
async def create_study(test: StudyTest, db: AsyncSession = Depends(get_db)):
    try:
        await asyncio.gather(
            utils.create_study_folder(test.id),
            utils.create_kinescope_folder(test.id),
        )
    except Exception as e:
        raise e
    # return res
    res = str(asyncio.get_event_loop_policy())
    return res
