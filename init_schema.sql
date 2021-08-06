CREATE DATABASE film_zone;
USE film_zone;

CREATE TABLE persons(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(40) NOT NULL,
surname VARCHAR(40) NOT NULL,
birth_date DATETIME NOT NULL
);

CREATE TABLE user_types(
id VARCHAR(40) NOT NULL PRIMARY KEY,
name VARCHAR(40) NOT NULL
);

INSERT INTO user_types(id, name)
VALUES ('USER', 'User');
INSERT INTO user_types(id, name)
VALUES('ADMIN', 'Administrator');

CREATE TABLE users (
login VARCHAR(40) NOT NULL ,
password VARCHAR(40) NOT NULL,
user_type_id VARCHAR(40) NOT NULL,
person_id INT NOT NULL ,
CONSTRAINT forkeyus_ustypes
FOREIGN KEY (user_type_id)
REFERENCES user_types(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT forkeyus_pers
FOREIGN KEY (person_id)
REFERENCES persons(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY (login)
);

CREATE TABLE emails(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(50) NOT NULL,
user_login VARCHAR(40) NOT NULL,
CONSTRAINT forkeyemails_us
FOREIGN KEY (user_login)
REFERENCES users(login)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE genres(
id VARCHAR(30) NOT NULL PRIMARY KEY,
name VARCHAR(60) NOT NULL
);

INSERT INTO genres (id, name) VALUES('ACTION', 'Action');
INSERT INTO genres (id, name) VALUES('ADVENTURE', 'Adventure');
INSERT INTO genres (id, name) VALUES('COMEDY', 'Comedy');
INSERT INTO genres (id, name) VALUES('DRAMA', 'Drama');
INSERT INTO genres (id, name) VALUES('CRIME', 'Crime');
INSERT INTO genres (id, name) VALUES('SCI_FI', 'sci-fi');
INSERT INTO genres (id, name) VALUES('FANTASY', 'fantasy');
INSERT INTO genres (id, name) VALUES('MUSICAL', 'Musical');
INSERT INTO genres (id, name) VALUES('WESTERN', 'Western');
INSERT INTO genres (id, name) VALUES('POST_APOCALYPTIC', 'Post-apocalyptic');
INSERT INTO genres (id, name) VALUES('WAR', 'War');
INSERT INTO genres (id, name) VALUES('FAMILY', 'Family film');
INSERT INTO genres (id, name) VALUES('LOVE', 'Love story');
INSERT INTO genres (id, name) VALUES('CARTOON', 'Cartoon');
INSERT INTO genres (id, name) VALUES('HORROR', 'Horror');
INSERT INTO genres (id, name) VALUES('THRILLER', 'Thriller');
INSERT INTO genres (id, name) VALUES('DOCUMENTARY', 'Documentary');

CREATE TABLE films(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
duration INT NOT NULL,
name VARCHAR(80) NOT NULL,
release_date DATETIME NOT NULL,
rating FLOAT NOT NULL,
director_id INT NOT NULL,
CONSTRAINT forkeyfilms_pers
FOREIGN KEY (director_id)
REFERENCES persons(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE user_favorite_films(
user_login VARCHAR(40) NOT NULL,
film_id INT NOT NULL,
CONSTRAINT forkeyfav_films_us
FOREIGN KEY (user_login)
REFERENCES users(login)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT forkeyfav_films_films
FOREIGN KEY (film_id)
REFERENCES films(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY(user_login, film_id)
);

CREATE TABLE films_genres(
film_id INT NOT NULL,
film_genre_id VARCHAR(30) NOT NULL,
CONSTRAINT forkey_gen_films
FOREIGN KEY (film_id)
REFERENCES films(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT forkey_gen_gen
FOREIGN KEY (film_genre_id)
REFERENCES genres(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY(film_id, film_genre_id)
);

CREATE TABLE characters(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(60) NOT NULL,
comment VARCHAR(1000),
film_id INT NOT NULL,
CONSTRAINT forkey_char_films
FOREIGN KEY (film_id)
REFERENCES films(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE characters_actors(
character_id INT NOT NULL,
person_id INT NOT NULL,
CONSTRAINT forkey_charactors_char
FOREIGN KEY (character_id)
REFERENCES characters(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT forkey_charactors_pers
FOREIGN KEY (person_id)
REFERENCES persons(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY(character_id, person_id)
);

