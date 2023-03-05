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
	
INSERT INTO album (id, album_name, release_year, performer_id)
VALUES
	(1, 'Album 1', 2018, 3),
	(2, 'Album 2', 2006, 7),
	(3, 'Album 3', 1981, 1),
	(4, 'Album 4', 1990, 2),
	(5, 'Album 5', 2018, 6),
	(6, 'Album 6', 2020, 4),
	(7, 'Album 7', 2018, 8),
	(8, 'Album 8', 2000, 3);

INSERT INTO track (performer_id, album_id, track_name, duration)
VALUES
	(7, 5, 'Track 1', 4.55),
	(4, 3, 'Track 2 my', 2.03),
	(5, 2, 'Track 3', 1.03),
	(3, 6, 'Track 4', 3.70),
	(8, 4, 'Track 5 мой', 20.38),
	(6, 1, 'Track 6', 12.03),
	(1, 8, 'Track 7', 2.08),
	(2, 7, 'Track 8', 3.08),
	(4, 8, 'Track 9', 3.20),
	(7, 4, 'Track 10', 2.10),
	(3, 1, 'Track 11', 4.47),
	(5, 6, 'Track 12', 7.50),
	(4, 2, 'Track 13', 6.37),
	(7, 2, 'Track 14', 1.53),
	(3, 1, 'Track 15', 3.80);

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
	(13, 7),
	(14, 6),
	(15, 1);

INSERT INTO performer_genre
VALUES
	(1, 5),
	(2, 3),
	(3, 1),
	(4, 7),
	(5, 6),
	(6, 2),
	(7, 4),
	(8, 8);

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