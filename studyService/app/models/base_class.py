from sqlalchemy.orm import DeclarativeBase

class Base(DeclarativeBase):
    
    def update(self, **kwargs):
        for key, value in kwargs.items():
            if hasattr(self, key):
                setattr(self, key, value)