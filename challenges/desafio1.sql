DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price FLOAT(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE user_person(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES plan (id),
    subscribe_date DATE NOT NULL
) engine = InnoDB;

CREATE TABLE artist(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE album(
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artist (id),
    name VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
) engine = InnoDB;

CREATE TABLE song(
    id INT PRIMARY KEY AUTO_INCREMENT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES album (id),
    artist_id int,
    FOREIGN KEY (artist_id) REFERENCES artist (id),
    name VARCHAR(255) NOT NULL,
    duration_seconds INT NOT NULL
) engine = InnoDB;

CREATE TABLE playback_history(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user_person (id),
    song_id INT,
    FOREIGN KEY (song_id) REFERENCES song (id),
    date_time DATETIME,
    UNIQUE (user_id, song_id, date_time)
) engine = InnoDB;

CREATE TABLE artist_follow(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user_person (id),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artist (id),
    UNIQUE (user_id, artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plan (name, price)
VALUES
  ('Gratuito', 0.00),
  ('Universitário', 5.99),
  ('Pessoal', 6.99),
  ('Familiar', 7.99);

INSERT INTO SpotifyClone.user_person (name, age, plan_id, subscribe_date)
VALUES
	('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, 1, '2017-01-06'),
	('Ada Lovelace', 37, 2, '2017-12-30'),
	('Martin Fowler', 46, 2, '2017-01-17'),
	('Sandi Metz', 58, 2, '2018-04-29'),
	('Paulo Freire', 19, 3, '2018-02-14'),
	('Bell Hooks', 26, 3, '2018-01-05'),
	('Christopher Alexander', 85, 4, '2019-06-05'),
	('Judith Butler', 45, 4, '2020-05-13'),
	('Jorge Amado', 58, 4, '2017-02-17');
    
INSERT INTO SpotifyClone.artist (name)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO SpotifyClone.album (artist_id, name, release_year)
VALUES
	(1, 'Renaissance', 2022),
	(2, 'Jazz', 1978),
	(2, 'Hot Space', 1982),
	(3, 'Falso Brilhante', 1998),
	(3, 'Vento de Maio', 2001),
	(4, 'QVVJFA?', 2003),
	(5, 'Somewhere Far Beyond', 2007),
	(6, 'I Put A Spell On You', 2012);
    
INSERT INTO SpotifyClone.song (album_id, artist_id, name, duration_seconds)
VALUES
	(1, 1, 'BREAK MY SOUL', 279),
	(1, 1, 'VIRGO\'S GROOVE', 369),
	(1, 1, 'ALIEN SUPERSTAR', 116),
	(2, 2, 'Don\'t Stop Me Now', 203),
	(3, 2, 'Under Pressure', 152),
	(4, 3, 'Como Nossos Pais', 105),
	(5, 3, 'O Medo de Amar é o Medo de Ser Livre', 207),
	(6, 4, 'Samba em Paris', 267),
	(7, 5, 'The Bard\'s Song', 244),
	(8, 6, 'Feeling Good', 100);
    
INSERT INTO SpotifyClone.playback_history (user_id, song_id, date_time)
VALUES
	(1, 1, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');
    
INSERT INTO SpotifyClone.artist_follow (user_id, artist_id)
VALUES
	('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '1'),
	('7', '6'),
	('9', '3'),
	('10', '2');