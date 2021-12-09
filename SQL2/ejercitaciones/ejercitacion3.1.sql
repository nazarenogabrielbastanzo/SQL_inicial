/* Crear una tabla persona sin primary key y solamente con dos campos: id y nombre */
CREATE TABLE persona (
  id INT,
  nombre VARCHAR(45)
);

/* Inserte datos siguiendo un orden no secuencial para el id. */
INSERT INTO persona VALUES
(1, 'Nazareno'),
(3, 'Jorge'),
(2, 'Pedro'),
(5, 'José'),
(4, 'Marcos');

/* Consulte los datos para visualizar el orden de registros. */
SELECT * FROM persona;

/* Agregue una clave primaria para el campo id. */
ALTER TABLE persona ADD CONSTRAINT PK_id PRIMARY KEY(id);

/* Consulte los datos para visualizar el orden de registros. */
SELECT * FROM persona;