import os, shutil
import errno
from dotenv import load_dotenv
from pathlib import Path
from typing import TypedDict
# import httpx
import asyncio

env_path = Path(".") / ".env"
load_dotenv(dotenv_path=env_path)


async def create_study_folder(study_id: int, dir="assets/studies") -> str:
    path = os.path.join(dir, "study_" + str(study_id))
    os.makedirs(path, exist_ok=True)
    await asyncio.sleep(1)
    return path


async def delete_study_folder(study_id: int, dir="assets/studies") -> str:
    path = os.path.join(dir, "study_" + str(study_id))
    if not os.path.exists(path):
        raise FileNotFoundError(errno.ENOENT, path)
    shutil.rmtree(path)
    return path


class KinescopeFolderInfo(TypedDict):
    name: str
    id: int
