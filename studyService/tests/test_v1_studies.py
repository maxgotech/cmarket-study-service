import pytest
from fastapi import status
from httpx import AsyncClient


@pytest.mark.anyio
async def test_get_studies(async_client: AsyncClient):
    res = await async_client.get("/api/v1/studies/")
    assert res.status_code == status.HTTP_200_OK
