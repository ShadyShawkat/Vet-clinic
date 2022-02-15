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

-- A transaction that updates animals species according to their names.
BEGIN;
  UPDATE animals
  SET species = 'digimon'
  WHERE name LIKE '%mon';

  UPDATE animals
  SET species = 'pokemon'
  WHERE name NOT LIKE '%mon';
COMMIT;

-- A transaction that deletes all records. Then roll back the change.
BEGIN;
  DELETE FROM animals;
ROLLBACK;

-- A transaction that updates weigths to be positive
BEGIN;
	DELETE FROM animals
	WHERE date_of_birth > '2022-01-01';
	SAVEPOINT delete_save_point;
	
	UPDATE animals
	SET weight_kg = weight_kg * -1;
	ROLLBACK TO delete_save_point;
	
	UPDATE animals
	SET weight_kg = weight_kg * -1
	WHERE weight_kg < 0;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) AS "Number of animals"
FROM animals

-- How many animals have never tried to escape?
SELECT COUNT(*) AS "Number of animals that never tried to escape"
FROM animals
WHERE escape_attempts = 0

-- What is the average weight of animals?
SELECT CONCAT(AVG(weight_kg), ' kg') AS "Average weight of animals"
FROM animals

-- Who escapes the most, neutered or not neutered animals?

-- What is the minimum and maximum weight of each type of animal?

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

