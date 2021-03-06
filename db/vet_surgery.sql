DROP TABLE visits;
DROP TABLE pets;
DROP TABLE vets;
DROP TABLE clients;

CREATE TABLE clients (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_number VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE vets (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL8 PRIMARY KEY,
  vet_id INT8 REFERENCES vets(id) ON DELETE SET NULL,
  client_id INT8 REFERENCES clients(id) ON DELETE CASCADE,
  name VARCHAR(255),
  date_of_birth DATE,
  species VARCHAR(255)
);

CREATE TABLE visits (
  id SERIAL8 PRIMARY KEY,
  pet_id INT8 REFERENCES pets(id) ON DELETE CASCADE,
  vet_id INT8 REFERENCES vets(id) ON DELETE SET NULL,
  treatment_notes VARCHAR(510),
  intake_date DATE,
  discharge_date DATE
);
