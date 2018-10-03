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
('Luisa', 'Peralda', 'lperalda@correo.com'),
('Linda', 'Zapata', 'lzapata@correo.com'),
('Luna', 'Miranda', 'lmiranda@correo.com');

-- Ingresar 2 imágenes por usuario.
INSERT INTO images(user_id, name, upload_date, img_path) VALUES
(1, 'Florcita', '03-10-2018', 'fake/path/florcita.jpg'),
(1, 'Perrito lindo', '03-10-2018', 'fake/path/perrito_lindo.jpg'),
(2, 'Mi Gatito', '03-10-2018', 'fake/path/mi_gatito.jpg'),
(2, 'Cariño', '03-10-2018', 'fake/path/carino.jpg'),
(3, 'aaa', '03-10-2018', 'fake/path/aaa.jpg'),
(3, 'prueba', '03-10-2018', 'fake/path/prueba.jpg'),
(4, 'Jarra de dulces', '03-10-2018', 'fake/path/jarra_de_dulces.jpg'),
(4, 'En la playa', '03-10-2018', 'fake/path/en_la_playa.jpg');

-- Ingresar 3 likes por cada imagen.
INSERT INTO likes VALUES
(1,1),(2,1),(4,1),
(1,2),(2,2),(4,2),
(1,3),(2,3),(3,3),
(1,4),(2,4),(4,4),
(1,5),(2,5),(3,5),
(2,6),(3,6),(4,6),
(1,7),(3,7),(4,7),
(1,8),(2,8),(4,8);

-- Ingresar 8 tags.
INSERT INTO tags(name) VALUES
('lindo'),('de moda'),('el mejor'),('animales'),
('no lo vean'),('mi dia'),('hipster'),('zzz');

-- Ingresar 3 tags por imagen.
INSERT INTO images_tags VALUES
(1,1),(1,3),(1,6),
(2,5),(2,4),(2,7),
(3,2),(3,8),(3,3),
(4,1),(4,3),(4,5),
(5,4),(5,2),(5,1),
(6,6),(6,7),(6,8),
(7,4),(7,6),(7,8),
(8,2),(8,6),(8,7);

-- Crear una consulta que muestre el nombre de la imagen y la cantidad de
-- likes que tiene esa imagen.
SELECT images.name, COUNT(*)
FROM images
LEFT JOIN likes ON (images.id = likes.image_id)
GROUP BY images.name;

-- Crear una consulta que muestre el nombre del usuario y los nombres de las
-- fotos que le pertenecen.
SELECT first_name, last_name, name
FROM users
LEFT JOIN images ON (users.id = images.user_id);

-- Crear una consulta que muestre el nombre del tag y la cantidad de imagenes
-- asociadas a ese tag.
SELECT tags.name, COUNT(*)
FROM tags
LEFT JOIN images_tags ON (tags.id = images_tags.tag_id)
GROUP BY tags.name;
