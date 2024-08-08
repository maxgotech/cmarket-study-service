from fastapi import FastAPI
from app.api import router
from app.core.config import settings
from app.models.base import Base
from app.core.session import engine


def create_tables():
    Base.metadata.create_all(bind=engine)


def start_application():
    app = FastAPI(title=settings.PROJECT_NAME, version=settings.PROJECT_VERSION)
    app.include_router(router)
    create_tables()
    return app


app = start_application()
