/* Nombre, apellido y cursos que realiza cada estudiante */
SELECT e.nombre AS "Nombre",
e.apellido AS "Apellido",
c.nombre AS "Curso"
FROM ESTUDIANTE AS e INNER JOIN CURSO AS c;

/* Nombre, apellido y cursos que realiza cada estudiante, ordenados por el nombre del curso */
SELECT e.nombre AS "Nombre",
e.apellido AS "Apellido",
c.nombre AS "Curso"
FROM ESTUDIANTE AS e INNER JOIN CURSO AS c
ORDER BY c.nombre;

/* Nombre, apellido y cursos que dicta cada profesor */
SELECT p.nombre AS "Nombre",
p.apellido AS "Apellido",
c.nombre AS "Curso"
FROM PROFESOR AS p INNER JOIN CURSO AS c;

/* Nombre, apellido y cursos que dicta cada profesor, ordenados por el nombre del curso */
SELECT p.nombre AS "Nombre",
p.apellido AS "Apellido",
c.nombre AS "Curso"
FROM PROFESOR AS p INNER JOIN CURSO AS c
ORDER BY c.nombre;

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