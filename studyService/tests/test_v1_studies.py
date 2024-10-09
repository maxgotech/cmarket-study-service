import pytest
import unittest
import json

from dataclasses import dataclass
from typing import Any
from fastapi import status
from unittest.mock import patch, AsyncMock
from app.models.studies import StudyModel
from typing import Any
from app.schemas.study import StudyCreate


@dataclass
class Case:
    name: str
    data: Any
    values: Any
    status: int


@pytest.mark.anyio
async def test_get_studies(async_client):
    with (
        patch("app.api.v1.studies.crud_study") as mock_crud,
        patch("app.api.v1.studies.send_one", AsyncMock(return_value=None)),
    ):
        # mock for return value
        mock_response = AsyncMock()
        # setting the value that db would have returned
        mock_response.return_value = [StudyModel(id=1, name="Study", study_order=1)]
        # setting the mock
        mock_crud.get_multi = mock_response

        res = await async_client.get("/api/v1/studies/")
        assert res.status_code == status.HTTP_200_OK


@pytest.mark.anyio
async def test_create_study(async_client):
    cases: list[Case] = [
        Case(
            name="USER NOT FOUND",
            data=StudyCreate(name="Study", userid=1),
            values=StudyModel(id=1, name="Study", study_order=1, userid=1),
            status=status.HTTP_404_NOT_FOUND,
        ),
        Case(
            name="OK",
            data=StudyCreate(name="Study", userid=4),
            values=StudyModel(id=1, name="Study", study_order=1, userid=4),
            status=status.HTTP_201_CREATED,
        ),
        Case(
            name="RANDOM INPUT",
            data=StudyModel(name="Study", study_order=1),
            values=StudyModel(id=1, name="Study", study_order=1, userid=4),
            status=status.HTTP_422_UNPROCESSABLE_ENTITY,
        ),
    ]
    with (
        patch("app.api.v1.studies.crud_study") as mock_crud,
        patch("app.api.v1.studies.send_one", AsyncMock(return_value=None)),
    ):
        for tc in cases:
            mock_response = AsyncMock()
            mock_response.return_value = tc.values
            mock_crud.create = mock_response

            res = await async_client.post(
                "/api/v1/studies/",
                data=json.dumps(tc.data.dict()),
            )
            assert res.status_code == tc.status, tc.name


if __name__ == "__main__":
    unittest.main()
