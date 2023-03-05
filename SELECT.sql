SELECT album_name, release_year FROM album
	WHERE release_year = 2018;

SELECT track_name, duration FROM track
	WHERE duration = (SELECT max(duration) FROM track);

SELECT track_name FROM track
	WHERE duration >= 3.5;

SELECT compilation_name FROM compilation
	WHERE release_year >= 2018 AND release_year <= 2020;

SELECT performer_name FROM performer
	WHERE performer_name NOT LIKE '% %';

SELECT track_name FROM track
	WHERE track_name LIKE '%мой%' OR track_name LIKE '%my%';
