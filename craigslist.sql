DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE Regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Users
(
  id SERIAL PRIMARY KEY,
	username TEXT NOT NULL,
	password TEXT NOT NULL,
	preferred_region_id INTEGER REFERENCES Regions
);

CREATE TABLE Categories
(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE Posts
(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	text TEXT NOT NULL,
	user_id INTEGER REFERENCES Users,
	location TEXT NOT NULL,
	region_id INTEGER REFERENCES Regions,
	category_id INTEGER REFERENCES Categories
);