/* Escribe una consulta que devuelva la cantidad de profesores que dictan más de un curso en el turno Noche. */
SELECT count(*) FROM 
  (SELECT PROFESOR_id FROM curso 
    WHERE turno = 'Noche' 
    GROUP BY PROFESOR_id 
    HAVING count(*) > 1) AS prof;

/* Escribe una consulta para obtener la información de todos los estudiantes que no realizan el curso con código 105. */
SELECT est.nombre, est.apellido
FROM ESTUDIANTE est 
WHERE est.legajo NOT IN 
	(select ESTUDIANTE_legajo FROM INSCRIPCION 
		where CURSO_codigo = 105 );