/* COUNT */
/* Para contar la cantidad de estudiantes inscriptos al curso
Algoritmos, sabiendo que su código es 101, podemos ejecutar lo
siguiente: */
SELECT COUNT(ESTUDIANTE_legajo)
FROM INSCRIPCION
where CURSO_codigo = 101;

/* Sin embargo, puede ocurrir que no sepamos el código del curso
Algoritmos. En ese caso, es posible resolver esta situación
utilizando INNER JOIN: */
SELECT COUNT(ESTUDIANTE_legajo)
FROM INSCRIPCION I INNER JOIN CURSO C
ON I.CURSO_codigo = C.codigo
WHERE C.nombre = 'Algoritmos';

/* SUM */
/* Para conocer la cantidad de dinero que se destina a los salarios,
se debería ejecutar lo siguiente:
 */
SELECT SUM(salario)
FROM PROFESOR;

/* MAX, MIN */
/* supongamos que se necesita saber el mínimo y el máximo salario
de los profesores. Para eso, es posible ejecutar lo siguiente: */  
SELECT MAX(Salario) as "Máximo Salario",
MIN(Salario) as "Mínimo Salario"
FROM PROFESOR;

/* AVG (Average = Promedio) */
/* Se puede usar la siguiente consulta para calcular el promedio de
salarios de los profesores: */
SELECT AVG(Salario)
FROM PROFESOR;

/* ROUND */
/* En el ejemplo anterior, se puede redondear el resultado usando la
función ROUND:
 */ 
SELECT ROUND(AVG(Salario),2)
FROM PROFESOR;

/* GROUP BY (1) */
/* Si queremos saber la cantidad de estudiantes por carrera, la
sintaxis sería la siguiente: */ 
SELECT carrera, COUNT(*)
FROM estudiante
GROUP BY carrera;

/* GROUP BY (2) */
/* Si queremos saber la cantidad de estudiantes de cada profesor,
podemos ejecutar la siguiente sintaxis:
 */ 
SELECT p.id, count(*) as "Cantidad de estudiantes"
FROM PROFESOR p INNER JOIN CURSO c on p.id = c.PROFESOR_id
INNER JOIN INSCRIPCION I on c.codigo =
I.CURSO_codigo
GROUP BY p.id;

/* HAVING */
/* Si queremos saber qué cantidad de cursos se dictan en cada
turno, pero, a su vez, queremos filtrar los turnos con más de dos
cursos, podemos utilizar la siguiente consulta: */ 
SELECT turno, COUNT(*)
FROM alkemy.curso
GROUP BY turno HAVING COUNT(*) > 2;
