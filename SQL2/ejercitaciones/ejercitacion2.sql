/* Nombre, apellido y cursos que realiza cada estudiante */
SELECT est.nombre 'Nombre', est.apellido 'Apellido', cur.nombre 'Curso' 
FROM ESTUDIANTE est INNER JOIN CURSO cur
ON est.legajo IN (SELECT ESTUDIANTE_legajo FROM INSCRIPCION);

/* Nombre, apellido y cursos que realiza cada estudiante, ordenados por el nombre del curso */
SELECT est.nombre 'Nombre', est.apellido 'Apellido', cur.nombre 'Curso' 
FROM ESTUDIANTE est INNER JOIN CURSO cur
ON est.legajo IN (SELECT ESTUDIANTE_legajo FROM INSCRIPCION)
ORDER BY cur.nombre;

/* Nombre, apellido y cursos que dicta cada profesor */
SELECT pro.nombre AS 'Nombre', pro.apellido AS 'Apellido', cur.nombre AS 'Curso'
FROM PROFESOR AS pro INNER JOIN CURSO AS cur
ON pro.id = cur.PROFESOR_id;

/* Nombre, apellido y cursos que dicta cada profesor, ordenados por el nombre del curso */
SELECT pro.nombre AS 'Nombre', pro.apellido AS 'Apellido', cur.nombre AS 'Curso'
FROM PROFESOR AS pro INNER JOIN CURSO AS cur
ON pro.id = cur.PROFESOR_id
ORDER BY cur.nombre;

/* Cupo disponible para cada curso (Si el cupo es de 35 estudiantes y hay 5 inscriptos, el cupo disponible será 30) */
SELECT cur.nombre, cur.cupo, COUNT(ins.CURSO_codigo) AS 'Ocupado',
cur.cupo - COUNT(ins.CURSO_codigo) AS 'Disponible'
FROM CURSO cur LEFT JOIN INSCRIPCION ins
ON cur.codigo = ins.CURSO_codigo
GROUP BY cur.cupo, CUR.nombre;

/* Cursos cuyo cupo disponible sea menor a 10 */
SELECT cur.nombre AS 'Cursos' FROM CURSO AS cur
LEFT JOIN INSCRIPCION AS ins
ON cur.codigo = ins.CURSO_codigo
GROUP BY cur.cupo, cur.nombre
HAVING cur.cupo - COUNT(ins.CURSO_codigo) < 10;