CREATE DATABASE pintagram;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(65),
  last_name VARCHAR(65),
  email VARCHAR(65)
);

CREATE TABLE images(
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  name VARCHAR(65),
  upload_date DATE NOT NULL,
  img_path VARCHAR(65)
);

CREATE TABLE likes(
  user_id INTEGER REFERENCES users(id),
  image_id INTEGER REFERENCES images(id),
  PRIMARY KEY(user_id, image_id)
);

CREATE TABLE tags(
  id SERIAL PRIMARY KEY,
  name VARCHAR(65)
);

CREATE TABLE images_tags(
  image_id INTEGER REFERENCES images(id),
  tag_id INTEGER REFERENCES tags(id)
);

INSERT INTO users(first_name, last_name, email) VALUES
('Pedro', 'Zamora', 'pzamora@correo.com'),
('Luisa', 'Peralda', 'lperalda@correo.com');

-- Ingresar 2 imágenes por usuario.

-- Ingresar 3 likes por cada imagen.

-- Ingresar 8 tags.

-- Ingresar 3 tags por imagen.

-- Crear una consulta que muestre el nombre de la imagen y la cantidad de
-- likes que tiene esa imagen.

-- Crear una consulta que muestre el nombre del usuario y los nombres de las
-- fotos que le pertenecen.

-- Crear una consulta que muestre el nombre del tag y la cantidad de imagenes
-- asociadas a ese tag.
