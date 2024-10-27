from fastapi import FastAPI
from api.routers import user_router, movimentacao_router

app = FastAPI()

app.include_router(user_router.router, prefix="/usuarios", tags=["Usuarios"])
app.include_router(movimentacao_router.router, prefix="/movimentacao", tags=["Movimentações"])