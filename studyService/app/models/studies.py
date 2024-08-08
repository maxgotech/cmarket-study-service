from dataclasses import dataclass
from sqlalchemy.orm import Mapped, mapped_column
from app.models.base_class import Base


@dataclass
class StudyModel(Base):
    __tablename__ = "study"
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(nullable=False)
    study_order: Mapped[int] = mapped_column(default=1)
    id_content: Mapped[int] = mapped_column(nullable=False)
    id_kinescope_folder: Mapped[str] = mapped_column(nullable=True)
    type_content: Mapped[int] = mapped_column(nullable=True)  # 1 - text, 2 - video
    