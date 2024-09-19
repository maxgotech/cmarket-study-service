import asyncio
import pytest

from asgi_lifespan import LifespanManager
from httpx import AsyncClient
from app.main import app


# run only asyncio, not trio
@pytest.fixture(scope="session")
def anyio_backend():
    return "asyncio"


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
