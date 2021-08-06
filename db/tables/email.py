from sqlalchemy import Column, String, Integer, ForeignKey

from sqlalchemy.orm import relationship

from ..base import Base


class Email(Base):

    __tablename__ = 'emails'

    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    email = Column(String, nullable=False)
    user_login = Column(String, ForeignKey('users.login', ondelete='CASCADE'), nullable=False)

    user = relationship('User')