from sqlalchemy import Column, Integer, String
from database import Base

class User(Base):
    _tablename_ = "users"
    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, index=True, nullable=False)
    senha = Column(String, nullable=False)