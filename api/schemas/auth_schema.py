from pydantic import BaseModel, EmailStr

class AuthSchema(BaseModel):
    email: EmailStr
    senha: str

class AuthRetornoSchema(BaseModel):
    logado: bool
    id: int
