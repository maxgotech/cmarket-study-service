from dataclasses import dataclass
from sqlalchemy.orm import Mapped, mapped_column
from app.models.base_class import Base


@dataclass
class VideoModel(Base):
    __tablename__ = "video"
    id: Mapped[int] = mapped_column(primary_key=True)
    id_video: Mapped[str] = mapped_column(nullable=False)
