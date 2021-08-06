from sqlalchemy import Column, String, Integer, ForeignKey

from sqlalchemy.orm import relationship

from ..base import Base


class UserFavoriteFilm(Base):

    __tablename__ = 'user_favorite_films'

    user_login = Column(String, ForeignKey('users.login', ondelete='CASCADE'), nullable=False, primary_key=True)
    film_id = Column(Integer, ForeignKey('films.id', ondelete='CASCADE'), nullable=False, primary_key=True)

    user = relationship('User')
    film = relationship('Film')
