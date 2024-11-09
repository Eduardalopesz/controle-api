from fastapi import APIRouter, HTTPException, Depends
from ..repositories.auth_repository import autenticar_usuario
from ..schemas.auth_schema import AuthSchema, AuthRetornoSchema


auth_router = APIRouter()

@auth_router.post("/login", response_model=AuthRetornoSchema)
async def login(auth_data: AuthSchema):
    resultado = autenticar_usuario(auth_data.email, auth_data.senha)
    if resultado:
        return resultado
    raise HTTPException(status_code=401, detail="Não autorizado")