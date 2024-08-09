from app.crud.base import CRUDBase
from app.models.studies import StudyModel
from app.schemas.study import StudyCreate, StudyUpdate

CRUDStudy = CRUDBase[StudyModel, StudyCreate, StudyUpdate]
crud_study = CRUDStudy(StudyModel)
