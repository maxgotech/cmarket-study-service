import pytest
from fastapi import status
from httpx import AsyncClient


@pytest.mark.anyio
async def test_health(async_client: AsyncClient):
    res = await async_client.get("/api/health/")
    assert res.status_code == status.HTTP_204_NO_CONTENT
