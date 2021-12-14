/* Escriba una consulta que devuelva el legajo y la cantidad de cursos que realiza cada estudiante. */
SELECT ins.ESTUDIANTE_legajo AS 'Legajo', est.nombre AS 'Nombre', est.apellido AS 'Apellido', COUNT(ins.CURSO_codigo) AS 'Cantidad de cursos' 
FROM INSCRIPCION ins INNER JOIN ESTUDIANTE est
ON ins.ESTUDIANTE_legajo = est.legajo
GROUP BY ins.ESTUDIANTE_legajo, est.nombre, est.apellido;

/* Escriba una consulta que devuelva el legajo y la cantidad de cursos de los estudiantes que realizan más de un curso. */
SELECT ins.ESTUDIANTE_legajo AS 'Legajo', est.nombre AS 'Nombre', est.apellido AS 'Apellido', COUNT(ins.CURSO_codigo) AS 'Cantida de cursos'
FROM INSCRIPCION ins INNER JOIN ESTUDIANTE est
ON ins.ESTUDIANTE_legajo = est.legajo
GROUP BY ins.ESTUDIANTE_legajo, est.nombre, est.apellido
HAVING COUNT(ins.CURSO_codigo) > 1;

/* Escriba una consulta que devuelva la información de los estudiantes que no realizan ningún curso */
SELECT * FROM ESTUDIANTE
WHERE legajo NOT IN (SELECT ESTUDIANTE_legajo from INSCRIPCION); 

-- Escriba para cada tabla, los index (incluyendo su tipo) que tiene cada una.
-- ?

-- Liste toda la información sobre los estudiantes que realizan cursos con los profesores de apellido "Pérez" y "Paz".
SELECT * FROM ESTUDIANTE
WHERE legajo IN (
	SELECT ins.ESTUDIANTE_legajo FROM INSCRIPCION ins JOIN CURSO cur
	ON cur.PROFESOR_id IN (
		SELECT id from PROFESOR 
		WHERE apellido = 'Pérez' OR apellido = 'Paz'));