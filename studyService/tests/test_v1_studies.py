import pytest
import unittest
import json

from dataclasses import dataclass
from typing import Any
from fastapi import status
from unittest.mock import patch, AsyncMock
from app.models.studies import StudyModel
from typing import Any, Optional
from app.schemas.study import StudyCreate, StudyUpdate


@dataclass
class Case:
    name: str
    data: Any
    values: Any
    status: int
    user: Optional[int] = None
    addon: Any = None


@pytest.mark.anyio
async def test_get_studies(async_client):
    cases: list[Case] = [
        Case(
            name="OK",
            data=None,
            values=[StudyModel(id=1, name="Study", study_order=1, userid=4)],
            status=status.HTTP_200_OK,
        ),
    ]

    with (
        patch("app.api.v1.studies.crud_study") as mock_crud,
        patch("app.api.v1.studies.send_one", AsyncMock(return_value=None)),
    ):
        for tc in cases:
            mock_crud.get_multi = AsyncMock(return_value=tc.values)

            res = await async_client.get("/api/v1/studies/")
            assert res.status_code == status.HTTP_200_OK, tc.name


@pytest.mark.anyio
async def test_get_study(async_client):
    cases: list[Case] = [
        Case(
            name="OK",
            data=1,
            values=StudyModel(id=1, name="Study", study_order=1, userid=1),
            status=status.HTTP_200_OK,
        ),
        Case(
            name="STUDY NOT FOUND",
            data=20,
            values=None,
            status=status.HTTP_404_NOT_FOUND,
        ),
    ]

    with (
        patch("app.api.v1.studies.crud_study") as mock_crud,
        patch("app.api.v1.studies.send_one", AsyncMock(return_value=None)),
    ):
        for tc in cases:
            mock_crud.get = AsyncMock(return_value=tc.values)

            res = await async_client.get("/api/v1/studies/" + str(tc.data))
            assert res.status_code == tc.status, tc.name


@pytest.mark.anyio
async def test_create_study(async_client):
    cases: list[Case] = [
        Case(
            name="USER NOT FOUND",
            data=StudyCreate(name="Study", userid=1),
            values=StudyModel(id=1, name="Study", study_order=1, userid=1),
            user=0,
            status=status.HTTP_404_NOT_FOUND,
        ),
        Case(
            name="OK",
            data=StudyCreate(name="Study", userid=4),
            values=StudyModel(id=1, name="Study", study_order=1, userid=4),
            status=status.HTTP_201_CREATED,
            user=4,
        ),
        Case(
            name="RANDOM INPUT",
            data=StudyModel(name="Study", study_order=1),
            values=StudyModel(id=1, name="Study", study_order=1, userid=4),
            user=4,
            status=status.HTTP_422_UNPROCESSABLE_ENTITY,
        ),
    ]
    with (
        patch("app.api.v1.studies.crud_study") as mock_crud,
        patch("app.api.v1.studies.send_one", AsyncMock(return_value=None)),
        patch("app.api.v1.studies.get_user") as user_mock,
    ):
        for tc in cases:
            mock_crud.create = AsyncMock(return_value=tc.values)
            user_mock.return_value = tc.user
            res = await async_client.post(
                "/api/v1/studies/",
                data=json.dumps(tc.data.dict()),
            )
            assert res.status_code == tc.status, tc.name


@pytest.mark.anyio
async def test_update_study(async_client):
    cases: list[Case] = [
        Case(
            name="INVALID REQUEST BODY",
            data=StudyCreate(name="Study", userid=1),
            values=None,
            addon=StudyModel(id=1, name="Study", study_order=1, userid=1),
            status=status.HTTP_422_UNPROCESSABLE_ENTITY,
        ),
        Case(
            name="STUDY NOT FOUND",
            data=StudyUpdate(
                id=4,
                name="New name",
                type_content=None,
                id_content=None,
                courseid=None,
                moduleid=None,
            ),
            values=StudyModel(id=1, name="Study", study_order=1, userid=1),
            addon=None,
            status=status.HTTP_404_NOT_FOUND,
        ),
        Case(
            name="OK",
            data=StudyUpdate(
                id=4,
                name="New name",
                type_content=None,
                id_content=None,
                courseid=None,
                moduleid=None,
            ),
            values=StudyModel(id=1, name="Study", study_order=1, userid=4),
            addon=StudyModel(id=1, name="Study", study_order=1, userid=1),
            status=status.HTTP_200_OK,
        ),
    ]
    with (
        patch("app.api.v1.studies.crud_study") as mock_crud,
        patch("app.api.v1.studies.send_one", AsyncMock(return_value=None)),
    ):
        for tc in cases:
            mock_crud.update = AsyncMock(return_value=tc.values)
            mock_crud.get = AsyncMock(return_value=tc.addon)
            res = await async_client.patch(
                "/api/v1/studies/",
                data=json.dumps(tc.data.dict()),
            )
            assert res.status_code == tc.status, tc.name


@pytest.mark.anyio
async def test_delete_study(async_client):
    cases: list[Case] = [
        Case(
            name="INVALID REQUEST BODY",
            data=None,
            values=None,
            addon=None,
            status=status.HTTP_422_UNPROCESSABLE_ENTITY,
        ),
        Case(
            name="STUDY NOT FOUND",
            data=5,
            values=None,
            addon=None,
            status=status.HTTP_404_NOT_FOUND,
        ),
        Case(
            name="OK",
            data=5,
            values=None,
            addon=StudyModel(id=1, name="Study", study_order=1, userid=1),
            status=status.HTTP_204_NO_CONTENT,
        ),
    ]
    with (
        patch("app.api.v1.studies.crud_study") as mock_crud,
        patch("app.api.v1.studies.send_one", AsyncMock(return_value=None)),
    ):
        for tc in cases:
            mock_crud.delete = AsyncMock(return_value=tc.values)
            mock_crud.get = AsyncMock(return_value=tc.addon)
            res = await async_client.delete("/api/v1/studies/" + str(tc.data))
            assert res.status_code == tc.status, tc.name


if __name__ == "__main__":
    unittest.main()
