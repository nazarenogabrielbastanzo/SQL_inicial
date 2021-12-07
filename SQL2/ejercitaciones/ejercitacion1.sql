/* Escriba una consulta para saber cuántos estudiantes son de la carrera Mecánica. */
SELECT COUNT(carrera) AS "Estudiantes de Mecánica"
FROM ESTUDIANTE
WHERE carrera = "Mecánica";

/* Escriba una consulta para saber, de la tabla PROFESOR, el salario mínimo de los profesores nacidos en la década del 80. */
SELECT MIN(salario) AS "Salario mínimo década 80"
FROM PROFESOR
WHERE fecha_nacimiento LIKE "198%";

/* Cantidad de pasajeros por país */
SELECT idpais, COUNT(*)
FROM PASAJERO
GROUP BY idpais;

/* Suma de todos los pagos realizados */
SELECT SUM(monto + impuesto) AS "Monto total"
FROM PAGO;

/* Suma de todos los pagos que realizó un pasajero. El monto debe aparecer con dos decimales. */
SELECT ROUND(SUM(monto + impuesto), 2) AS "Pagos realizados"
FROM PAGO
WHERE idpasajero = 3;

/* Promedio de los pagos que realizó un pasajero. */
SELECT ROUND(AVG(monto + impuesto), 2) AS "Promedio de pagos"
FROM PAGO
WHERE idpasajero = 3;