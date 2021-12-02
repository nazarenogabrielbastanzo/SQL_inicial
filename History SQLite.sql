--- 02-12-2021 15:53:15
--- SQLite
CREATE TABLE CURSO (
  codigo_curso INT Not NULL,
  nombre Varchar not NULL,
  descripcion varchar,
  turno varchar not NULL,
  PRIMARY KEY (codigo_curso));

--- 02-12-2021 15:57:03
--- SQLite
ALTER TABLE CURSO ADD cupo int;

--- 02-12-2021 16:13:23
--- SQLite
INSERT INTO CURSO VALUES (101, "Algoritmos", "Algoritmos y Estructura de Datos", "Mañana", 35),
(102, "Matemática Discreta", "", "Tarde", 30);

--- 02-12-2021 16:15:14
--- SQLite
INSERT INTO CURSO VALUES (103, "", "Análisis Matemático I", "Noche", 10);

--- 02-12-2021 16:16:15
--- SQLite
/***** ERROR ******
NOT NULL constraint failed: CURSO.nombre
 ----- 
INSERT INTO CURSO VALUES (104, NULL, "Análisis Matemático II", "Noche", 15);
*****/

--- 02-12-2021 16:17:34
--- SQLite
/***** ERROR ******
UNIQUE constraint failed: CURSO.codigo_curso
 ----- 
INSERT INTO CURSO VALUES (103, "", "Álgebra y Geometría Analítica", "Noche", 20);
*****/

--- 02-12-2021 16:18:48
--- SQLite
UPDATE CURSO SET cupo = 25;

--- 02-12-2021 16:20:07
--- SQLite
DELETE FROM CURSO WHERE nombre = "Algoritmos";

