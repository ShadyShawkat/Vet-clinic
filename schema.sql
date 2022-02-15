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
