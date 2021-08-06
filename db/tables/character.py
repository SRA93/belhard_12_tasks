from sqlalchemy import Column, String, Integer, ForeignKey

from sqlalchemy.orm import relationship

from ..base import Base


class Character(Base):

    __tablename__ = 'characters'

    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    name = Column(String, nullable=False)
    comment = Column(String)
    film_id = Column(Integer, ForeignKey('films.id', ondelete='CASCADE'), nullable=False)

    film = relationship('Film')