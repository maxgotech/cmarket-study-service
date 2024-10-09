from pydantic import BaseModel, Field
from typing import Optional


class StudyCreate(BaseModel):
    name: str = Field(..., description="study name")
    userid: int = Field(..., description="id of user creator")


class StudyUpdate(BaseModel):
    id: int
    name: Optional[str] = Field(None, description="study name")
    type_content: Optional[int] = Field(None, description="study type")
    id_content: Optional[int] = Field(None, description="id of content of this study")
    courseid: Optional[int] = Field(None, description="id of parent course")
    moduleid: Optional[int] = Field(None, description="if of parent module")


class StudyOut(BaseModel):
    id: int = Field(..., description="id of study")
    name: str = Field(..., description="study name")
    study_order: int = Field(..., description="order in queue inside module")
    id_content: Optional[int] = Field(None, description="id of study entry")

    # TODO(Maxim) remove Optional once update on folder after creation
    # is implemented
    id_kinescope_folder: Optional[str] = Field(
        None, description="id of kinescope folder"
    )
    type_content: Optional[int] = Field(None, description="type of study content")
