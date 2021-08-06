from sqlalchemy import Column, String, Integer, ForeignKey, DateTime, Float

from sqlalchemy.orm import relationship

from ..base import Base


class Film(Base):

    __tablename__ = 'films'

    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    duration = Column(Integer, nullable=False)
    name = Column(String, nullable=False)
    release_date = Column(DateTime, nullable=False)
    rating = Column(Float, nullable=False)
    director_id = Column(Integer, ForeignKey('persons.id', ondelete='CASCADE'), nullable=False)

    director = relationship('Person')