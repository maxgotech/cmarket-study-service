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


async def create_kinescope_folder(id: int) -> KinescopeFolderInfo:
    folder_name = "study_" + str(id)
    
    # Kinescope changed their API so porevious request fails
    # TODO(Maxim): Update kinescope API requests
    
    # async with httpx.AsyncClient() as client:
    #     response = client.post(
    #         "https://api.kinescope.io/v1/projects/"
    #         + os.environ["API_KINESCOPE_PARENT_ID"]
    #         + "/folders",
    #         headers={"Authorization": "Bearer " + os.environ["API_KINESCOPE_TOKEN"]},
    #         data={"name": folder_name},
    #     )
    #     res = (await response).json()
    #     print(res)
    #     return res
    
    # emulatuing Kinescope Request
    await asyncio.sleep(2)
    
    return {
        'name': folder_name,
        'id' : id
    }
