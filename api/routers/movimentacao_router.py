from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from ..database import Sessionlocal
from ..repositories import movimentacao_repository
from ..schemas.movimentacao import movimentacao_retorno_schema

router = APIRouter()

def get_db():
 
    db_session = Sessionlocal()
    try:
        yield db_session
    finally:
        db_session.close()


@router.get("/listar/{id}", response_model=list[movimentacao_retorno_schema.MovimentacaoRetornoSchema])
def listar_movimentacoes_usuario(id: int, db: Session = Depends(get_db)):
    return movimentacao_repository.listar_movimentacao_usuario(id, db)