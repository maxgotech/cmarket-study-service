import os
from dotenv import load_dotenv
from pathlib import Path

env_path = Path(".") / ".env"
load_dotenv(dotenv_path=env_path)


class Settings:
    PROJECT_NAME: str = "CMARKET-STUDY-SERVICE"
    PROJECT_VERSION: str = "1.0.0"

    DATABASE_URI = os.environ["DATABASE_URI"]


settings = Settings()
