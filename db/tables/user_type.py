from sqlalchemy import Column, String

from ..base import Base


class UserType(Base):

    __tablename__ = 'user_types'

    id = Column(String, primary_key=True)
    name = Column(String, nullable=False)

    def __repr__(self):
        return f'<User type: {self.id}, {self.name}>'
