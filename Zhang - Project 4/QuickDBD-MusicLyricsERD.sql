-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/NWHpqc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- relationship between popular and unpopular songs

CREATE TABLE "musicdf_file" (
    "year" FLOAT   NOT NULL,
    "track_name" VARCHAR(100)   NOT NULL,
    "track_popularity" FLOAT   NOT NULL,
    "album" VARCHAR(100)   NOT NULL,
    "artist_name" VARCHAR(100)   NOT NULL,
    "artist_genres" VARCHAR   NOT NULL,
    "artist_popularity" FLOAT   NOT NULL,
    "danceability" FLOAT   NOT NULL,
    "energy" FLOAT   NOT NULL,
    "key" FLOAT   NOT NULL,
    "loudness" FLOAT   NOT NULL,
    "speechiness" FLOAT   NOT NULL,
    "acousticness" FLOAT   NOT NULL,
    "instrumentalness" FLOAT   NOT NULL,
    "liveness" FLOAT   NOT NULL,
    "valence" FLOAT   NOT NULL,
    "tempo" FLOAT   NOT NULL,
    "duration_min" FLOAT   NOT NULL
);

CREATE TABLE "lyricsdf" (
    "track_name" VARCHAR(100)   NOT NULL,
    "album" VARCHAR(100)   NOT NULL,
    "artist_name" VARCHAR(100)   NOT NULL,
    "artist_genres" VARCHAR   NOT NULL,
    "artist_popularity" FLOAT   NOT NULL,
    "lyrics" VARCHAR   NOT NULL
);

CREATE TABLE "unpopular_df_file" (
    "danceability" FLOAT   NOT NULL,
    "energy" FLOAT   NOT NULL,
    "key" FLOAT   NOT NULL,
    "loudness" FLOAT   NOT NULL,
    "speechiness" FLOAT   NOT NULL,
    "acousticness" FLOAT   NOT NULL,
    "instrumentalness" FLOAT   NOT NULL,
    "liveness" FLOAT   NOT NULL,
    "valence" FLOAT   NOT NULL,
    "tempo" FLOAT   NOT NULL,
    "duration_min" FLOAT   NOT NULL,
    "popularity" FLOAT   NOT NULL,
    "track_name" VARCHAR(100)   NOT NULL,
    "artist_name" VARCHAR(100)   NOT NULL
);

ALTER TABLE "musicdf_file" ADD CONSTRAINT "fk_musicdf_file_track_name_album" FOREIGN KEY("track_name", "album")
REFERENCES "lyricsdf" ("track_name", "album");

ALTER TABLE "musicdf_file" ADD CONSTRAINT "fk_musicdf_file_artist_name" FOREIGN KEY("artist_name")
REFERENCES "unpopular_df_file" ("artist_name");

