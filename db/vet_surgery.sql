DROP TABLE pets;
DROP TABLE vets;

CREATE TABLE vets (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL8 PRIMARY KEY,
  vet_id INT8 REFERENCES vets(id) ON DELETE SET NULL,
  name VARCHAR(255),
  date_of_birth VARCHAR(255),
  species VARCHAR(255),
  owner_contact_info VARCHAR(255),
  treatment_notes VARCHAR(510)
);
