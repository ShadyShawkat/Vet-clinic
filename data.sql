/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES 
  (1, 'Agumon', '2020-02-03', 0, true, 10.23),
	(2, 'Gabumon', '2018-11-15', 2, true, 8),
	(3, 'Pikachu', '2021-01-07', 1, false, 15.04), 
	(4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
  (5, 'Charmander', '2020-02-08', 0, false, -11),
	(6, 'Plantmon', '2022-11-15', 2, true, -5.7),
	(7, 'Squirtle', '1993-04-02', 3, false, -12.13),
  (8, 'Angemon', '2005-06-12', 1, true, -45),
  (9, 'Boarmon', '2005-06-07', 7, true, 20.4),
  (10, 'Blossom', '1998-08-13', 3, true, 17)

-- Insert data into owners table
INSERT INTO owners (full_name, age)  
  VALUES 
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

-- Insert data into species table
INSERT INTO species (name)  
  VALUES 
    ('Pokemon'),
    ('Digimon');

-- Modify animals so it includes the species_id value:
UPDATE animals
  SET species_id = 2
  WHERE name LIKE '%mon';

UPDATE animals
  SET species_id = 1
  WHERE name NOT LIKE '%mon';

-- Modify animals to include owner information (owner_id)
UPDATE animals
  SET owner_id = 1
  WHERE name = 'Agumon';

UPDATE animals
  SET owner_id = 2
  WHERE name in ('Gabumon', 'Pikachu');

UPDATE animals
  SET owner_id = 3
  WHERE name in ('Devimon', 'Plantmon');

UPDATE animals
  SET owner_id = 4
  WHERE name in ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
  SET owner_id = 5
  WHERE name in ('Angemon', 'Boarmon');

-- Insert data into vets table
INSERT INTO vets (name, age, date_of_graduation)  
  VALUES 
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08')

-- Insert data into specializations table
INSERT INTO specializations (vet_id, species_id)  
  VALUES
    (1, 1),
    (3, 1),
    (3, 2),
    (4, 2)

-- Insert data into visits table
INSERT INTO visits (vet_id, animal_id, date_of_visit)  
  VALUES
    ((SELECT id FROM vets WHERE name = 'William Tatcher'),
	 (SELECT id FROM animals WHERE name = 'Agumon'),
	 '2020-05-24'),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	 (SELECT id FROM animals WHERE name = 'Agumon'),
	 '2020-07-22'),
    ((SELECT id FROM vets WHERE name = 'Jack Harkness'),
	 (SELECT id FROM animals WHERE name = 'Gabumon'),
	 '2021-02-02'),
    ((SELECT id FROM vets WHERE name = 'Maisy Smith'),
	 (SELECT id FROM animals WHERE name = 'Pikachu'),
	 '2020-01-05'),
    ((SELECT id FROM vets WHERE name = 'Maisy Smith'),
	 (SELECT id FROM animals WHERE name = 'Pikachu'),
	 '2020-03-08'),
    ((SELECT id FROM vets WHERE name = 'Maisy Smith'),
	 (SELECT id FROM animals WHERE name = 'Pikachu'),
	 '2020-05-14'),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	 (SELECT id FROM animals WHERE name = 'Devimon'),
	 '2021-05-04'),
    ((SELECT id FROM vets WHERE name = 'Jack Harkness'),
	 (SELECT id FROM animals WHERE name = 'Charmander'),
	 '2021-02-24'),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	 (SELECT id FROM animals WHERE name = 'Squirtle'),
	 '2019-09-29'),
    ((SELECT id FROM vets WHERE name = 'Jack Harkness'),
	 (SELECT id FROM animals WHERE name = 'Angemon'),
	 '2020-10-03'),
    ((SELECT id FROM vets WHERE name = 'Jack Harkness'),
	 (SELECT id FROM animals WHERE name = 'Angemon'),
	 '2020-11-04'),
    ((SELECT id FROM vets WHERE name = 'Maisy Smith'),
	 (SELECT id FROM animals WHERE name = 'Boarmon'),
	 '2019-01-24'),
    ((SELECT id FROM vets WHERE name = 'Maisy Smith'),
	 (SELECT id FROM animals WHERE name = 'Boarmon'),
	 '2019-05-15'),
    ((SELECT id FROM vets WHERE name = 'Maisy Smith'),
	 (SELECT id FROM animals WHERE name = 'Boarmon'),
	 '2020-02-27'),
    ((SELECT id FROM vets WHERE name = 'Maisy Smith'),
	 (SELECT id FROM animals WHERE name = 'Boarmon'),
	 '2020-08-03'),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	 (SELECT id FROM animals WHERE name = 'Blossom'),
	 '2020-05-24'),
    ((SELECT id FROM vets WHERE name = 'William Tatcher'),
	 (SELECT id FROM animals WHERE name = 'Blossom'),
	 '2021-01-11');

