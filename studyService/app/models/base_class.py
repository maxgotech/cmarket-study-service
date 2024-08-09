from sqlalchemy.orm import DeclarativeBase
from typing import Any, Dict
from sqlalchemy import inspect


class Base(DeclarativeBase):
    def dict(self) -> Dict[str, Any]:
        return {c.key: getattr(self, c.key) for c in inspect(self).mapper.column_attrs}
