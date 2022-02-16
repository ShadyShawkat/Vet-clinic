/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name VARCHAR(20),
    date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

ALTER TABLE animals
    ADD COLUMN species VARCHAR(20);

-- Create owners table
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

-- Create species tables
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255)
);

-- Alter column id in animals table to be auto incremented and primary key
ALTER TABLE animals
    ADD PRIMARY KEY (id),
    ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

-- Remove column species
ALTER TABLE animals
    DROP COLUMN species

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
	ADD COLUMN species_id INT,
	ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species (id)

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
	ADD COLUMN owner_id INT,
	ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owner_id) REFERENCES owners (id)

-- Insert data into owners table
INSERT INTO owners (full_name, age)  
VALUES 
	('Sam Smith', 34),