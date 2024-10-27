from pydantic import BaseModel

class TipoMovimentacaoBase(BaseModel):
    codigo: str
    descricao: str

class TipoMovimentacaoCreate(TipoMovimentacaoBase):
    pass

class TipoMovimentacao(TipoMovimentacaoBase):
    id: int

    class Config:
        orm_mode = True