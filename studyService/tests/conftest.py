import asyncio

from asgi_lifespan import LifespanManager

from app.models.base import Base
import pytest
from httpx import AsyncClient
from app.main import app
from app.core.session import engine
from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker
from sqlalchemy.sql import text


# run only asyncio, not trio
@pytest.fixture(scope="session")
def anyio_backend():
    return "asyncio"


# drop all database every time when test complete
@pytest.fixture(scope="session")
async def async_db_engine():
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)

    yield engine

    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)


# truncate all table to isolate tests
@pytest.fixture(scope="function")
async def async_db(async_db_engine):
    async_session = async_sessionmaker(
        expire_on_commit=False,
        autocommit=False,
        autoflush=False,
        bind=async_db_engine,
        class_=AsyncSession,
    )

    async with async_session() as session:
        await session.begin()

        yield session

        await session.rollback()

        for table in reversed(Base.metadata.sorted_tables):
            stmt = text(f"TRUNCATE {table.name} CASCADE;")
            await session.execute(stmt)
            await session.commit()


@pytest.fixture(scope="session")
async def async_client():
    async with AsyncClient(app=app, base_url="http://test") as ac, LifespanManager(app):
        yield ac


# let test session to know it is running inside event loop
@pytest.fixture(scope="session")
def event_loop():
    """Overrides pytest default function scoped event loop"""
    loop = asyncio.get_event_loop()
    yield loop
    loop.close()
