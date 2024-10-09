import asyncio
import socket

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from starlette.responses import Response
from sqlalchemy import select
from fastapi import status

from app.core.session import get_db

router = APIRouter(prefix="/health", tags=["Health"])


@router.get("/", status_code=status.HTTP_204_NO_CONTENT)
async def health(db: AsyncSession = Depends(get_db)):
    try:
        await asyncio.wait_for(db.execute(select(1)), timeout=1)
    except (asyncio.TimeoutError, socket.gaierror):
        return Response(status_code=status.HTTP_503_SERVICE_UNAVAILABLE)
    return Response(status_code=status.HTTP_204_NO_CONTENT)
