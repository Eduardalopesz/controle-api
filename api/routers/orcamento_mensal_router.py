from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import get_db
from schemas.orcamento_mensal_schema import OrcamentoMensal, OrcamentoMensalCreate
from repositories import orcamento_mensal as orcamento_repo

router = APIRouter()

@router.post("/orcamentos/", response_model=OrcamentoMensal)
def create_orcamento(orcamento: OrcamentoMensalCreate, usuario_id: int, db: Session = Depends(get_db)):
    return orcamento_repo.create_orcamento_mensal(db, orcamento, usuario_id)

@router.get("/orcamentos/{orcamento_id}", response_model=OrcamentoMensal)
def read_orcamento(orcamento_id: int, db: Session = Depends(get_db)):
    db_orcamento = orcamento_repo.get_orcamento_mensal(db, orcamento_id)
    if db_orcamento is None:
        raise HTTPException(status_code=404, detail="Orçamento não encontrado")
    return db_orcamento