from sqlalchemy.orm import Session
from sqlalchemy.exc import IntegrityError
from datetime import datetime
from models import BalancoMensal, Movimentacao

def atualizar_balanco_mensal(db: Session, usuario_id: int, valor: float, tipo: str) -> None:
    """Atualiza o balanço mensal do usuário."""
    data_atual = datetime.now()
    mes_atual = data_atual.month
    ano_atual = data_atual.year

    
    balanco = db.query(BalancoMensal).filter(
        BalancoMensal.usuario_id == usuario_id,
        BalancoMensal.mes == mes_atual,
        BalancoMensal.ano == ano_atual
    ).first()

    if not balanco:
        
        try:
            balanco = BalancoMensal(
                usuario_id=usuario_id,
                mes=mes_atual,
                ano=ano_atual,
                total_receitas=valor if tipo == "receita" else 0,
                total_despesas=valor if tipo == "despesa" else 0
            )
            db.add(balanco)
        except IntegrityError:
            db.rollback()
            balanco = db.query(BalancoMensal).filter(
                BalancoMensal.usuario_id == usuario_id,
                BalancoMensal.mes == mes_atual,
                BalancoMensal.ano == ano_atual
            ).first()

    else:
        
        if tipo == "receita":
            balanco.total_receitas += valor
        elif tipo == "despesa":
            balanco.total_despesas += valor

    balanco.data_atualizacao = datetime.now()
    db.commit()