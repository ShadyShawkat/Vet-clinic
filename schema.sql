/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int,
    name varchar(20),
    date_of_birth date,
	escape_attempts int,
	neutered bool,
	weight_kg decimal
);

ALTER TABLE animals
    ADD COLUMN species varchar(20);

-- Create owners table
CREATE TABLE owners (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name varchar(255),
    age int
);

-- Create species tables
CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(255)
);

-- Alter column id in animals table to be auto incremented and primary key
ALTER TABLE animals
    ADD PRIMARY KEY (id),
    ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

-- Remove column species
ALTER TABLE animals
    DROP COLUMN species
