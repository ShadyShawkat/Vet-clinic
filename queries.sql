/*Queries that provide answers to the questions from all projects.*/

SELECT *
FROM animals
WHERE name like '%mon'

SELECT name
FROM animals
WHERE date_part('year',  date_of_birth)
BETWEEN '2016' AND '2019'

SELECT name
FROM animals
WHERE neutered = true
AND escape_attempts < 3

SELECT date_of_birth
FROM animals
WHERE name
IN ('Agumon', 'Pikachu')

SELECT name, escape_attempts
FROM animals
WHERE weight_kg > 10.5

SELECT *
FROM animals
WHERE neutered = true

SELECT *
FROM animals
WHERE name 
NOT IN('Gabumon')

SELECT *
FROM animals
WHERE weight_kg
BETWEEN 10.4 AND 17.3

-- A transaction update the animals table by setting the species column to unspecified. Then roll back the change.

BEGIN;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;
