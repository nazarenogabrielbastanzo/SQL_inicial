CREATE table PROFESOR (
  id Int NOT NULL,
  nombre varchar not NULL,
  apellido varchar not NULL,
  fecha_nacimiento VARCHAR not NULL,
  salario int not NULL,
  PRIMARY key (id));

CREATE TABLE CURSO (
  codigo_curso INT Not NULL,
  nombre Varchar not NULL,
  descripcion varchar,
  turno varchar not NULL,
  cupo INT NOT NULL,
  PROFESOR_id INT NOT NULL,
  PRIMARY KEY (codigo_curso),
  CONSTRAINT FK_ProfesorId FOREIGN KEY (PROFESOR_id) REFERENCES PROFESOR(id));
  

INSERT INTO PROFESOR VALUES 
(1, "Juan", "Pérez", "1990-06-06", 55000),
(2, "María Emilia", "Paz", "1984-07-15", 72000),
(3, "Martín", "Correa", "1987-12-07", 63000),
(4, "Lucía", "Díaz", "1991-02-24", 45000),
(5, "Raúl", "Martínez", "1980-10-15", 85000),
(6, "Mabel", "Ríos", "1982-06-12", 83000);

INSERT INTO CURSO VALUES
(101, "Algoritmos", "Algoritmos y Estructura de Datos", "Mañana",20, 1),
(102, "Matemática Discreta", null, "Tarde",20, 2),
(103, "Programación Java", "POO en Java", "Noche",35, 4),
(104, "Programación Web", null, "Noche",35, 5),
(105, "Programación C#", ".NET, Visual Studio 2019", "Noche",30, 6);

-- No es posible (Natural Join):
SELECT * FROM PROFESOR p JOIN CURSO c ON p.PROFESOR_id = c.PROFESOR_id;

SELECT PROFESOR.apellido, CURSO.nombre, CURSO.Turno
FROM PROFESOR LEFT JOIN CURSO ON PROFESOR.id = CURSO.PROFESOR_id;

-- Respuesta correcta:
SELECT PROFESOR.apellido, CURSO.nombre, CURSO.Turno
FROM PROFESOR INNER JOIN CURSO ON PROFESOR.id = CURSO.PROFESOR_id;