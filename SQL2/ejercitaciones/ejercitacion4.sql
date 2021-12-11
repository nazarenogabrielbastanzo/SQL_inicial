/* Escribe una consulta que devuelva la cantidad de profesores que dictan más de un curso en el turno Noche. */
SELECT prof.id, prof.nombre, prof.apellido, cur.turno
from PROFESOR prof inner JOIN CURSO cur
ON cur.turno = 'Noche'
AND prof.id = cur.PROFESOR_id;

/* Escribe una consulta para obtener la información de todos los estudiantes que no realizan el curso con código 105. */
