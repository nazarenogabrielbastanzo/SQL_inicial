/* Consultar todas las columnas de la tabla PROFESOR */
SELECT * FROM PROFESOR;

/* Consultar solamente los nombres de los profesores */
SELECT nombre FROM PROFESOR;

/* Consultar nombre, apellido y cursos que dicta cada profesor */
SELECT p.nombre, p.apellido, c.nombre
FROM PROFESOR p INNER JOIN CURSO c ON p.id =
c.PROFESOR_id;

/* Consultar todas las columnas resultantes del JOIN entre
PROFESOR y CURSO
 */
SELECT * FROM PROFESOR p INNER JOIN CURSO c
ON p.id = c.PROFESOR_id;

/* AS */
/* La consulta
anterior puede escribirse de la siguiente manera: */
SELECT p.nombre, p.apellido, c.nombre
FROM PROFESOR AS p INNER JOIN CURSO AS c ON p.id =
c.PROFESOR_id;

/* Utilizar AS también es útil cuando queremos que, en el resultado
de la consulta, una columna se muestre con otro nombre: */
SELECT p.nombre AS "Nombre", p.apellido AS "Apellido", c.nombre AS "Curso"
FROM PROFESOR AS p INNER JOIN CURSO AS c ON p.id =
c.PROFESOR_id;

/* DISTINCT */
/* Utilizamos SELECT DISTINCT cuando queremos que la consulta
devuelva solo registros con valores diferentes.
 */

/* puede utilizarse con una sola columna: */
SELECT DISTINCT turno FROM CURSO;

/* Y también puede utilizarse con varias columnas: */
SELECT DISTINCT turno, cupo FROM CURSO;

/* WHERE */
/* Se trata de una sección de una consulta que permite agregar filtros o condiciones al resultado. El WHERE puede utilizarse independientemente de la cantidad de tablas que estén involucradas. */

/* para una sola tabla: */
SELECT * FROM PROFESOR WHERE id = 1;

/* Se puede, también, utilizar en una consulta con múltiples tablas, haciendo referencia a cada una con su alias: */
SELECT * FROM PROFESOR p 
INNER JOIN CURSO c 
ON p.Id = c.PROFESOR_id
WHERE c.cupo = 35;

/* LIKE */
/* LIKE permite filtrar "valores similares" en un campo texto. Es útil cuando solo conocemos una parte del valor que queremos filtrar, pero no sabemos cómo es en su totalidad, es decir, que hay valores desconocidos. Por ejemplo, si queremos obtener todos los cursos que tengan en su nombre la palabra "Programación", podemos ejecutar la siguiente sintaxis:  */
SELECT * FROM CURSO
WHERE nombre LIKE '%Programación%';
/* Con los porcentajes, especificamos que puede haber 0 o más caracteres desconocidos antes (cuando lo agregamos antes de la palabra) o al final (cuando lo agregamos después de la palabra). */

/* Además de los porcentajes, es posible utilizar guiones bajos. El guion bajo se utiliza cuando sabemos exactamente la cantidad de caracteres desconocidos que hay adelante (o al final) de la parte conocida de la palabra. Supongamos que ejecutamos la siguiente consulta: */
SELECT * FROM CURSO
WHERE nombre LIKE '%Programación ____';

/* BETWEEN */
/* BETWEEN sirve para agregar un rango de valores como filtro. Por ejemplo, si queremos todos los cursos cuyo cupo sea entre 20 y 30, debemos usar la siguiente sintaxis: */
SELECT * FROM CURSO WHERE cupo BETWEEN 20 AND 30;
/* Se puede utilizar con consultas a una sola tabla o a varias, pero siempre referenciando a qué tabla corresponde el campo que se quiere utilizar como filtro. */

/* AND */
/* El operador lógico AND sirve para unir dos o más condiciones en una misma consulta SQL. Para que un registro sea incluido en el resultado, todas las condiciones que estén enlazadas con AND deben ser verdaderas. */
-- Ejemplo:
SELECT * FROM PROFESOR
WHERE fecha_nacimiento BETWEEN "1980-01-01" AND
"1989-12-31" AND Salario > 60000;

/* Asimismo, es posible agregar condiciones que hagan referencia a tablas diferentes: */
SELECT * FROM PROFESOR p INNER JOIN CURSO c 
ON p.id = c.PROFESOR_id
WHERE c.Cupo >= 30 AND p.Salario > 60000;

/* OR */
/* Al igual que AND, OR es un operador lógico para unir condiciones, pero la diferencia yace en que, para que un registro se incluya en el resultado, al menos una de las condiciones enlazadas con OR debe ser verdadera */
SELECT * FROM PROFESOR p INNER JOIN CURSO c 
ON p.id = c.PROFESOR_id
WHERE c.Cupo >= 30
OR p.Salario > 60000;

/* IN */
/* Cuando tenemos una lista de posibles valores para un campo, el operador IN es de mucha utilidad. IN nos permite especificar una lista de valores posibles en la sección del WHERE. */
-- Ejemplo:
SELECT * FROM curso
WHERE turno IN ("Mañana", "Tarde");
/* Con esa consulta, estamos pidiendo que todos los cursos se dicten en el turno mañana o en el turno tarde. Es una forma corta de escribir condiciones anidadas con OR: */
-- Ejemplo:
SELECT * FROM curso
WHERE turno = "Mañana"
OR turno = "Tarde";

/* ORDER BY */
/* Para ordenar el resultado de una consulta en orden ascendente o descendente (teniendo en cuenta uno o más campos), utilizamos ORDER BY, el cual nos permite ordenar columnas de consultas simples (a una tabla) o compuestas (muchas tablas). */

/* Por defecto, ORDER BY ordena los datos de manera ascendente. */
-- Ejemplo:
SELECT p.nombre, p.apellido, c.nombre as "curso"
FROM PROFESOR p INNER JOIN CURSO c 
ON p.id = c.PROFESOR_id
ORDER BY c.nombre;

/* Si quisiéramos hacerlo en forma descendente, esta sería la sintaxis: */
SELECT p.nombre, p.apellido, c.nombre
FROM PROFESOR p INNER JOIN CURSO c 
ON p.id = c.PROFESOR_id
ORDER BY c.nombre DESC;

/* Y si quisiéramos realizar el orden utilizando varios campos de diferentes tablas, la sintaxis sería esta: */
SELECT p.nombre AS "Nombre", 
p.apellido AS "Apellido", 
c.nombre AS "Curso"
FROM PROFESOR p INNER JOIN CURSO c 
ON p.id = c.PROFESOR_id
ORDER BY c.nombre DESC;

/* LIMIT */
/* La palabra reservada LIMIT sirve para especificar la cantidad máxima de registros que queremos en el resultado de una consulta. */

/* Es muy útil cuando se tiene una tabla con un gran volumen de datos y solo queremos ver los primeros registros. */
-- Ejemplo:
SELECT p.nombre, p.apellido, c.nombre
FROM PROFESOR AS p INNER JOIN CURSO AS c 
ON p.id = c.PROFESOR_id LIMIT 2;
/* Devolverá solamente dos registros, independientemente de la
cantidad resultante del cruce entre PROFESOR y CURSO. */

/* CASE */
/* El CASE va incluido en la parte del SELECT de una consulta. Sirve para evaluar varias condiciones y retornar un valor si estas son verdaderas. Evalúa las condiciones según el orden en el que aparecen. Si ninguna condición se cumple, se devolverá el valor que aparece después del ELSE. */
-- Ejemplo:
SELECT codigo, nombre, 
CASE
  WHEN descripcion IS NULL 
    THEN "El curso no tiene descripción"
    ELSE descripcion
  END "Descripción"
FROM curso;

/* UNION */
/* El operador UNION sirve para unir (combinar) el resultado de dos o más consultas. Para que eso sea posible, las consultas que se quieren unir deben devolver la misma cantidad de columnas. Y, además, que tengan tipos de datos compatibles.
Otro detalle para tener en cuenta con este operador es que solo devuelve registros distintos. */
-- Ejemplo:
SELECT nombre, apellido
FROM estudiante
  UNION
SELECT nombre, apellido
FROM profesor;

/* Si quisiéramos obtener todos los registros, sin eliminación de repetidos, tenemos que utilizar UNION ALL: */
SELECT nombre, apellido
FROM estudiante
  UNION ALL
SELECT nombre, apellido
FROM profesor;