from datetime import datetime

from db import session_scope
from db import tables

with session_scope() as session:

    genre_add = tables.Genre(name='ART')
    session.add(genre_add)
    session.commit()

    genre_del = session.query(tables.Genre).filter_by(name='ART').one()
    session.delete(genre_del)
    session.commit()

    res = session.query(tables.UserType).filter_by(id='USER').all()
    print(res)

    new_genre_name = session.query(tables.Genre).filter_by(id='FAMILY').one()
    new_genre_name.name = 'family'
    session.commit()
