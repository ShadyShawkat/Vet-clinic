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
SELECT *
FROM animals
WHERE escape_attempts = (
  SELECT MAX(escape_attempts)
  FROM animals
)

-- What is the minimum and maximum weight of each type of animal?
SELECT 
	species,
	MIN(weight_kg) Minimum_weight,
	MAX(weight_kg) Maximum_weight
FROM animals
GROUP BY species

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_part('year',  date_of_birth)
BETWEEN '1990' AND '2000'
GROUP BY species

-- What animals belong to Melody Pond?
SELECT animals.name
FROM animals
INNER JOIN owners
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond'

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals
INNER JOIN species
ON species.id = animals.species_id
WHERE species.name = 'Pokemon'

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id

-- How many animals are there per species?
SELECT species.name, count(animals)
FROM animals
INNER JOIN species
ON species.id = animals.species_id
GROUP BY species.name

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name
FROM animals
INNER JOIN species
ON species.id = animals.species_id
INNER JOIN owners
ON owners.id = animals.owner_id
WHERE species.name = 'Digimon'
AND owners.full_name = 'Jennifer Orwell'

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals
INNER JOIN owners
ON owners.id = animals.owner_id
WHERE animals.escape_attempts = 0
AND owners.full_name = 'Dean Winchester'

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals)
FROM owners
INNER JOIN animals
ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT(animals) DESC
LIMIT 1
