from sqlalchemy.orm import Mapped, mapped_column, relationship
from app.models.base_class import Base
from typing import TYPE_CHECKING

# needed to avoid circular imports
if TYPE_CHECKING:
    from app.models.studies import StudyModel


class UserModel(Base):
    __tablename__ = "user"
    id: Mapped[int] = mapped_column(primary_key=True)

    study: Mapped[list["StudyModel"]] = relationship(back_populates="user")
