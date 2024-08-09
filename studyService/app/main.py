from fastapi import FastAPI
from app.api import router
from app.core.config import settings
from app.core.session import init_db
from contextlib import asynccontextmanager


@asynccontextmanager
async def lifespan(app: FastAPI):
    # init db
    await init_db()
    yield


app = FastAPI(
    title=settings.PROJECT_NAME, version=settings.PROJECT_VERSION, lifespan=lifespan
)
app.include_router(router)
