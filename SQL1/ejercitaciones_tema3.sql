-- Nombre, apellido y fecha de nacimiento de todos los empleados, ordenado por fecha de nacimiento ascendente.
SELECT p.nombre as 'Nombre', p.apellido as 'Apellido', p.fecha_nacimiento as 'Fecha de Nacimiento' from PROFESOR p ORDER by fecha_nacimiento;

-- Todos los profesores cuyo salario sea mayor o igual a 65000.
SELECT * FROM PROFESOR WHERE salario >= 65000;

-- Todos los profesores que nacieron en la década del 80.
SELECT * FROM PROFESOR WHERE fecha_nacimiento LIKE '198%';

-- 5 registros
SELECT * FROM PROFESOR LIMIT 5;

-- Todos los profesores cuyo apellido inicie con la letra “P”
SELECT * FROM PROFESOR WHERE apellido LIKE 'P%';

-- Los profesores que nacieron en la década del 80 y tienen un salario mayor a 80000
SELECT * FROM PROFESOR WHERE fecha_nacimiento LIKE '198%' AND salario > 80000;