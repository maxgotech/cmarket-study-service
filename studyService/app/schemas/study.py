from pydantic import BaseModel
from typing import Optional


class StudyCreate(BaseModel):
    name: str
    user: str


class StudyUpdate(BaseModel):
    id: int
    type_content: Optional[int]
    id_content: Optional[int]
    course: Optional[int]
    module: Optional[int]
    name: Optional[str]