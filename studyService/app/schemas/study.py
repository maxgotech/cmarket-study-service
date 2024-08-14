from pydantic import BaseModel
from typing import Optional


class StudyCreate(BaseModel):
    name: str
    userid: int


class StudyUpdate(BaseModel):
    id: int
    name: Optional[str]
    type_content: Optional[int]
    id_content: Optional[int]
    courseid: Optional[int]
    moduleid: Optional[int]


class StudyOut(BaseModel):
    id: int
    name: str
    study_order: int
    id_content: Optional[int]

    # TODO(Maxim) remove Optional once update on folder after creation
    # is implemented
    id_kinescope_folder: Optional[str]
    type_content: Optional[int]
