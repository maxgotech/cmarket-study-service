from dataclasses import dataclass
from sqlalchemy.orm import Mapped, mapped_column, relationship
from app.models.base_class import Base
from sqlalchemy import ForeignKey
from app.models.course import CourseModel
from app.models.module import ModuleModel
from app.models.user import UserModel


@dataclass
class StudyModel(Base):
    __tablename__ = "study"
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(nullable=False)
    study_order: Mapped[int] = mapped_column(default=1)
    id_content: Mapped[int] = mapped_column(nullable=False)
    id_kinescope_folder: Mapped[str] = mapped_column(nullable=True)
    type_content: Mapped[int] = mapped_column(nullable=True)  # 1 - text, 2 - video

    courseid: Mapped[int] = mapped_column(ForeignKey("course.id"))
    course: Mapped["CourseModel"] = relationship(back_populates="study", lazy='selectin')

    moduleid: Mapped[int] = mapped_column(ForeignKey("module.id"))
    module: Mapped["ModuleModel"] = relationship(back_populates="study", lazy='selectin')

    userid: Mapped[int] = mapped_column(ForeignKey("user.id"))
    user: Mapped["UserModel"] = relationship(back_populates="study", lazy='selectin')
