DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE Medical_centers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  medical_center_id INTEGER REFERENCES Medical_centers
);

CREATE TABLE Patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthday DATE NOT NULL,
  insurance TEXT
);

CREATE TABLE Visits
(
  id SERIAL PRIMARY KEY,
	doctor_id INTEGER REFERENCES Doctors,
	patient_id INTEGER REFERENCES Patients,
	date DATE NOT NULL
);

CREATE TABLE Diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT
);

CREATE TABLE Diagnosis
(
	visit_id INTEGER REFERENCES Visits,
	disease_id INTEGER REFERENCES Diseases
);