from sqlalchemy.orm import Session
from models import TipoMovimentacao
from schemas.tipo_movimentacao_schema import TipoMovimentacaoCreate

def get_tipo_movimentacao(db: Session, tipo_id: int):
    return db.query(TipoMovimentacao).filter(TipoMovimentacao.id == tipo_id).first()

def get_tipos_movimentacao(db: Session, skip: int = 0, limit: int = 10):
    return db.query(TipoMovimentacao).offset(skip).limit(limit).all()

def create_tipo_movimentacao(db: Session, tipo: TipoMovimentacaoCreate):
    db_tipo = TipoMovimentacao(codigo=tipo.codigo, descricao=tipo.descricao)
    db.add(db_tipo)
    db.commit()
    db.refresh(db_tipo)
    return db_tipo