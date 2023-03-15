INSERT INTO genre (genre_name)
VALUES
	('Classic'),
	('Rock'),
	('Blues'),
	('Jazz'),
	('Pop'),
	('Disco'),
	('Rap'),
	('Folk');
	
INSERT INTO performer (performer_name)
VALUES
	('Ivan Ivanov'),
	('Oneword'),
	('Sergey Sergeev'),
	('Anna Annenkova'),
	('Nina Ninova'),
	('Ekaterina Ekaterinova'),
	('Anotheroneword'),
	('Elena Elenova');
	
INSERT INTO album (id, album_name, release_year)
VALUES
	(1, 'Album 1', 2018),
	(2, 'Album 2', 2006),
	(3, 'Album 3', 1981),
	(4, 'Album 4', 1990),
	(5, 'Album 5', 2018),
	(6, 'Album 6', 2020),
	(7, 'Album 7', 2018),
	(8, 'Album 8', 2019);

INSERT INTO track (album_id, track_name, duration)
VALUES
	(5, 'Track 1', 295),
	(3, 'Track 2 my', 123),
	(2, 'Track 3', 63),
	(6, 'Track 4', 250),
	(4, 'Track 5 мой', 1238),
	(1, 'Track 6', 623),
	(8, 'Track 7', 128),
	(7, 'Track 8', 188),
	(8, 'Track 9', 200),
	(4, 'Track 10', 130),
	(1, 'Track 11', 287),
	(6, 'Track 12', 470),
	(2, 'Track 13', 397),
	(2, 'Track 14', 93),
	(1, 'Track 15', 113);

INSERT INTO compilation (compilation_name, release_year)
VALUES
	('Compilation 1', 2017),
	('Compilation 2', 2005),
	('Compilation 3', 2018),
	('Compilation 4', 1990),
	('Compilation 5', 2022),
	('Compilation 6', 2000),
	('Compilation 7', 2020),
	('Compilation 8', 2007);

INSERT INTO track_compilation (track_id, compilation_id)
VALUES
	(1, 4),
	(2, 7),
	(3, 3),
	(4, 5),
	(5, 2),
	(6, 7),
	(7, 4),
	(8, 8),
	(9, 1),
	(10, 3),
	(11, 8),
	(12, 2),
	(13, 7);

INSERT INTO performer_genre
VALUES
	(7, 8),
	(7, 1),
	(7, 5),
	(4, 3),
	(4, 8),
	(4, 2),
	(3, 2),
	(3, 7),
	(3, 4),
	(3, 6),
	(3, 8),
	(3, 5);

INSERT INTO performer_album (performer_id, album_id)
VALUES
	(1, 3),
	(2, 7),
	(3, 2),
	(4, 4),
	(5, 5),
	(6, 3),
	(7, 8),
	(8, 1);