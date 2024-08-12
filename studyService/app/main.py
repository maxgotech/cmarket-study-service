from fastapi import FastAPI
from app.api import router
from app.core.config import settings
from app.core.session import init_db
from contextlib import asynccontextmanager


@asynccontextmanager
async def lifespan(app: FastAPI):
    # init db before app
    await init_db()
    yield

# init app
app = FastAPI(
    title=settings.PROJECT_NAME, version=settings.PROJECT_VERSION, lifespan=lifespan
)

# add router to app
app.include_router(router)
