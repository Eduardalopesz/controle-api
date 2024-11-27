from sqlalchemy.orm import Session
from sqlalchemy import literal
from models import Usuario
from ..schemas.auth_schema import AuthRetornoSchema

def autenticar_usuario(db: Session, email: str, senha: str) -> AuthRetornoSchema | None:

    senha_criptografada = db.execute(
        literal(f"CONVERT(VARBINARY(MAX), '{senha}')")
    ).scalar()
    

    usuario = db.query(Usuario).filter(
        Usuario.email == email,
        Usuario.senha == senha_criptografada
    ).first()
    
    if usuario:
        return AuthRetornoSchema(logado=True, id=usuario.id)
    
    return None
