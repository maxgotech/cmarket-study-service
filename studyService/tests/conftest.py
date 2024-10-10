import asyncio
import pytest

from httpx import AsyncClient
from app.main import app
from app.core.session import get_db


# run only asyncio, not trio
@pytest.fixture(scope="session")
def anyio_backend():
    return "asyncio"


@pytest.fixture(scope="session")
async def async_client():
    app.dependency_overrides[get_db] = override_get_db
    async with AsyncClient(app=app, base_url="http://test") as ac:
        yield ac


# let test session to know it is running inside event loop
@pytest.fixture(scope="session")
def event_loop():
    """Overrides pytest default function scoped event loop"""
    loop = asyncio.get_event_loop()
    yield loop
    loop.close()


class MockDb:
    async def execute(self, *args, **kwargs):
        return 1

    async def close(self):
        return


# override db injection
async def override_get_db():
    yield MockDb()
