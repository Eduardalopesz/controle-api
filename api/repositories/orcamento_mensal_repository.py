from sqlalchemy.orm import Session
from models import OrcamentoMensal
from schemas.orcamento_mensal_schema import OrcamentoMensalCreate

def get_orcamento_mensal(db: Session, orcamento_id: int):
    return db.query(OrcamentoMensal).filter(OrcamentoMensal.id == orcamento_id).first()

def create_orcamento_mensal(db: Session, orcamento: OrcamentoMensalCreate, usuario_id: int):
    db_orcamento = OrcamentoMensal(**orcamento.dict(), usuario_id=usuario_id)
    db.add(db_orcamento)
    db.commit()
    db.refresh(db_orcamento)
    return db_orcamento