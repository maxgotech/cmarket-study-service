from fastapi import APIRouter
from app.core.session import get_db
from app.crud.studies import crud_study
from fastapi import status

router = APIRouter(prefix="/home", tags=["Home"])


@router.get("/", status_code=status.HTTP_200_OK)
async def home():
    db = await get_db().__anext__()
    res = await crud_study.get_multi(db)
    return res
