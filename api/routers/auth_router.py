from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from schemas.auth_schema import AuthSchema, AuthRetornoSchema
from repositories.auth_repository import autenticar_usuario
from database import get_db

auth_router = APIRouter()

@auth_router.post("/auth/login", response_model=AuthRetornoSchema)
def login(auth_data: AuthSchema, db: Session = Depends(get_db)):
    resultado = autenticar_usuario(db, auth_data.email, auth_data.senha)
    if not resultado:
        raise HTTPException(status_code=401, detail="E-mail ou senha inválidos")
    return resultado
