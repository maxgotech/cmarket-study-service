from sqlalchemy.ext.asyncio import (
    AsyncSession,
    create_async_engine,
    AsyncEngine,
    async_sessionmaker,
)

from app.models.base import Base

from app.core.config import settings
from typing import AsyncGenerator

engine: AsyncEngine = create_async_engine(settings.DATABASE_URI)

SessionLocal = async_sessionmaker(engine, expire_on_commit=False)


async def init_db():
    async with engine.begin() as conn:
        # await conn.run_sync(SQLModel.metadata.drop_all)
        await conn.run_sync(Base.metadata.create_all)

async def get_db() -> AsyncGenerator[AsyncSession, None]:
    try:
        db = SessionLocal()
        yield db
    finally:
        await db.close()
