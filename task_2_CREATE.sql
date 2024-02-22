CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS performer (
	id BIGSERIAL PRIMARY KEY,
	performer_name VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS album(
	id BIGSERIAL PRIMARY KEY,
	album_name VARCHAR(120) NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year < 2024 AND release_year > 0)
);

CREATE TABLE IF NOT EXISTS compilation (
	id BIGSERIAL PRIMARY KEY,
	compilation_name VARCHAR(120) NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year < 2024 AND release_year > 0)
);

CREATE TABLE IF NOT EXISTS track (
	id BIGSERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(id),
	track_name VARCHAR(120) NOT NULL,
	duration INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS track_compilation (
	track_id INTEGER NOT NULL REFERENCES track(id),
	compilation_id INTEGER NOT NULL REFERENCES compilation(id),
	CONSTRAINT pk_tr_cmp PRIMARY KEY (track_id, compilation_id)
);

CREATE TABLE IF NOT EXISTS performer_genre (
	genre_id INTEGER NOT NULL REFERENCES genre(id),
	performer_id INTEGER NOT NULL REFERENCES performer(id),
	CONSTRAINT pk_pr_gnr PRIMARY KEY (genre_id, performer_id)
);

CREATE TABLE IF NOT EXISTS performer_album (
	album_id INTEGER NOT NULL REFERENCES album(id),
	performer_id INTEGER NOT NULL REFERENCES performer(id),
	CONSTRAINT pk_pr_alb PRIMARY KEY (album_id, performer_id)
);
