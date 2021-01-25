-- Crear DB
CREATE DATABASE normalizacion;

-- Conectar DB
\c normalizacion

-- Autores
CREATE TABLE autores(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Autores
CREATE TABLE editoriales(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Autores
CREATE TABLE lectores(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Libros
CREATE TABLE libros(
    codigo INT NOT NULL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL
);

-- autores_libros
CREATE TABLE autores_libros(
    id_autor INT NOT NULL REFERENCES autores(id),
    id_libro INT NOT NULL REFERENCES libros(codigo)
);

-- editoriales_libros
CREATE TABLE editoriales_libros(
    id_editorial INT NOT NULL REFERENCES editoriales(id),
    id_libro INT NOT NULL REFERENCES libros(codigo)
);

-- Préstamos
CREATE TABLE prestamos(
    id SERIAL NOT NULL PRIMARY KEY,
    id_libro INT NOT NULL REFERENCES libros(codigo),
    id_lector INT NOT NULL REFERENCES lectores(id),
    fecha_devolucion TIMESTAMP NOT NULL
);
