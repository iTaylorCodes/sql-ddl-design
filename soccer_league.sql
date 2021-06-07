DROP DATABASE IF EXISTS soccer_leagues_db;

CREATE DATABASE soccer_leagues_db;

\c soccer_leagues_db;

CREATE TABLE Teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE Players
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthday TEXT,
  height TEXT,
	team_id INTEGER REFERENCES Teams
);

CREATE TABLE Referees
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
	end_date DATE NOT NULL
);

CREATE TABLE Matches
(
  id SERIAL PRIMARY KEY,
  home_team_id INTEGER REFERENCES Teams,
	away_team_id INTEGER REFERENCES Teams,
	location TEXT NOT NULL,
	date DATE NOT NULL,
	season_id INTEGER REFERENCES Seasons,
	referee_id INTEGER REFERENCES Referees
);

CREATE TABLE Goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES Players,
  match_id INTEGER REFERENCES Matches
);

CREATE TABLE Lineups
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES Players,
	match_id INTEGER REFERENCES Matches,
	team_id INTEGER REFERENCES Teams
);

CREATE TABLE Results
(
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES Teams,
	match_id INTEGER REFERENCES Matches,
	result TEXT
);