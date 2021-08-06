from sqlalchemy import Column, String, Integer, ForeignKey

from sqlalchemy.orm import relationship

from ..base import Base


class User(Base):

    __tablename__ = 'users'

    login = Column(String, primary_key=True)
    password = Column(String, nullable=False)
    user_type_id = Column(String, ForeignKey('user_types.id', ondelete='CASCADE'), nullable=False)
    person_id = Column(Integer, ForeignKey('persons.id', ondelete='CASCADE'), nullable=False)

    user_type = relationship('UserType')
    person = relationship('Person')

    def __repr__(self):
        return f'<User: {self.login}, {self.user_type_id}>'