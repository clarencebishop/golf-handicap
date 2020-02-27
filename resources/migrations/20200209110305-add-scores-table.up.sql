CREATE TABLE scores
(
  id serial PRIMARY KEY,
  golfer VARCHAR(32) NOT NULL,
  course VARCHAR(16) NOT NULL,
  date_played VARCHAR(16) NOT NULL,
  rating NUMERIC,
  slope INTEGER,
  score INTEGER NOT NULL
);

--;;

CREATE INDEX name_idx ON scores (golfer);
