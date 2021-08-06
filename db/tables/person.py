from sqlalchemy import Column, String, Integer, DateTime

from ..base import Base


class Person(Base):

    __tablename__ = 'persons'

    id = Column(Integer, primary_key=True, autoincrement=True)
    surname = Column(String, nullable=False)
    name = Column(String, nullable=False)
    birth_date = Column(DateTime, nullable=False)