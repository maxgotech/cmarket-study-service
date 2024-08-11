from fastapi import APIRouter

from app.api.v1.studies import router as studies_router

router = APIRouter(prefix="/v1")
router.include_router(studies_router)
