from dataclasses import dataclass
from sqlalchemy.orm import Mapped, mapped_column
from app.models.base_class import Base
from sqlalchemy.dialects.mysql import MEDIUMTEXT


@dataclass
class TextModel(Base):
    __tablename__ = "text"
    id: Mapped[int] = mapped_column(primary_key=True)
    content: Mapped[str] = mapped_column(MEDIUMTEXT, nullable=False)
