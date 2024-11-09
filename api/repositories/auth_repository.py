from fastapi import Depends
from sqlalchemy.orm import Session
from database import get_db
from models.user import User
from schemas.auth_schema import AuthRetornoSchema

def autenticar_usuario(email: str, senha: str, db: Session = Depends(get_db)):

    senha_varbinary = senha.encode("utf-8")
    
    usuario = db.query(User).filter(User.email == email, User.senha == senha_varbinary).first()
    
    if usuario:
        return AuthRetornoSchema(logado=True, id=usuario.id)
    
    return None