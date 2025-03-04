-- drop conditions
DROP TABLE if exists musicdf_file;
DROP TABLE if exists lyricsdf;
DROP TABLE if exists unpopular_df_file;

-- creating tables
CREATE TABLE musicdf_file (
	"year" FLOAT,
	"track_name" VARCHAR(100),
	"track_popularity" INT,
	"album" VARCHAR(100),
	"artist_name" VARCHAR(100),
	"artist_genres" VARCHAR,
	"artist_popularity" INT,
	"danceability" FLOAT,
	"energy" FLOAT,
	"key" FLOAT,
	"loudness" FLOAT,
	"speechiness" FLOAT,
	"acousticness" FLOAT,
	"instrumentalness" FLOAT,
	"liveness" FLOAT,
	"valence" FLOAT,
	"tempo" FLOAT,
	"duration_min" FLOAT
);

CREATE TABLE lyricsdf (
	"track_name" VARCHAR(100),
	"album" VARCHAR(100),
	"artist_name" VARCHAR(100),
	"artist_genres" VARCHAR,
	"artist_popularity" FLOAT,
	"lyrics" VARCHAR(max)
);

CREATE TABLE unpopular_df_file (
	"danceability" FLOAT,
	"energy" FLOAT,
	"key" FLOAT,
	"loudness" FLOAT,
	"speechiness" FLOAT,
	"acousticness" FLOAT,
	"instrumentalness" FLOAT,
	"liveness" FLOAT,
	"valence" FLOAT,
	"tempo" FLOAT,
	"duration_min" FLOAT,
	"popularity" FLOAT,
	"track_name" VARCHAR(100),
	"artist_name" VARCHAR(100)
);



-- checking imports
SELECT * FROM musicdf_file;
SELECT * FROM lyricsdf;
SELECT * FROM unpopular_df_file;


-- additional queries
