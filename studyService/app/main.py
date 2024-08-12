from fastapi import FastAPI
from fastapi import FastAPI, Request
from app.api import router
from app.core.config import settings
from app.core.session import init_db
from contextlib import asynccontextmanager
import time

import asyncio
import uvloop

asyncio.set_event_loop_policy(uvloop.EventLoopPolicy())


@asynccontextmanager
async def lifespan(app: FastAPI):
    # init db before app
    await init_db()
    yield

# init app
app = FastAPI(
    title=settings.PROJECT_NAME, version=settings.PROJECT_VERSION, lifespan=lifespan
)

# add router to app
app.include_router(router)


# logger for request timing
@app.middleware("http")
async def add_process_time_header(request: Request, call_next):
    start_time = time.time()
    response = await call_next(request)
    print(
        "Time took to process the request and return response is {} sec".format(
            time.time() - start_time
        )
    )
    return response
