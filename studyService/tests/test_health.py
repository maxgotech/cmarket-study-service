import pytest
from fastapi import status
from httpx import AsyncClient
from unittest.mock import patch, AsyncMock
from tests.conftest import MockDb


@pytest.mark.anyio
async def test_health(db: MockDb, async_client: AsyncClient):
    res = await async_client.get("/api/health/")
    assert res.status_code == status.HTTP_204_NO_CONTENT
