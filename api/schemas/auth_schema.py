from pydantic import BaseModel

class AuthSchema(BaseModel):
    email: str
    senha: str

class AuthRetornoSchema(BaseModel):
    logado: bool
    id: int