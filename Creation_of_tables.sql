CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS Years (
	id BIGSERIAL PRIMARY KEY,
	year_item INTEGER CHECK (year_item < 2024 AND year_item > 0)
);

CREATE TABLE IF NOT EXISTS Performer (
	id BIGSERIAL PRIMARY KEY,
	performer_name VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album(
	id BIGSERIAL PRIMARY KEY,
	album_name VARCHAR(120) NOT NULL,
	year_id INTEGER NOT NULL REFERENCES Years(id),
	performer_id INTEGER NOT NULL REFERENCES Performer(id)
);

CREATE TABLE IF NOT EXISTS Compilation (
	id BIGSERIAL PRIMARY KEY,
	compilation_name VARCHAR(120) NOT NULL,
	year_id INTEGER NOT NULL REFERENCES Years(id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id BIGSERIAL PRIMARY KEY,
	performer_id INTEGER NOT NULL REFERENCES Performer(id),
	album_id INTEGER NOT NULL REFERENCES Album(id),
	track_name VARCHAR(120) NOT NULL,
	duration NUMERIC NOT NULL	
);

CREATE TABLE IF NOT EXISTS TrackCompilation (
	track_id INTEGER NOT NULL REFERENCES Tracks(id),
	compilation_id INTEGER NOT NULL REFERENCES Compilation(id),
	CONSTRAINT pk_tr_cmp PRIMARY KEY (track_id, compilation_id)
);

CREATE TABLE IF NOT EXISTS PerformerGenre (
	genre_id INTEGER NOT NULL REFERENCES Genres(id),
	performer_id INTEGER NOT NULL REFERENCES Performer(id),
	CONSTRAINT pk_pr_gnr PRIMARY KEY (genre_id, performer_id)
);

CREATE TABLE IF NOT EXISTS PerformerAlbum (
	album_id INTEGER NOT NULL REFERENCES Album(id),
	performer_id INTEGER NOT NULL REFERENCES Performer(id),
	CONSTRAINT pk_pr_alb PRIMARY KEY (album_id, performer_id)
)