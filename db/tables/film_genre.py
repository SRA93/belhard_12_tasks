from sqlalchemy import Column, String, Integer, ForeignKey

from sqlalchemy.orm import relationship

from ..base import Base


class FilmGenre(Base):

    __tablename__ = 'films_genres'

    film_id = Column(Integer, ForeignKey('films.id', ondelete='CASCADE'), nullable=False, primary_key=True)
    film_genre = Column(String, ForeignKey('genres.id', ondelete='CASCADE'), nullable=False, primary_key=True)

    film = relationship('Film')
    genre = relationship('Genre')