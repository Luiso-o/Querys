-- 1-Lista : primer apellido, segundo apellido, nombre en orden alfabetico de menor a mayor
/*select apellido1 as 'Primer apellido', apellido2 as 'Segundo apellido', nombre as 'Nombre del alumno' from persona
order by persona.apellido1 asc, persona.apellido2 asc, persona.nombre asc;*/

-- 2-Lista el nombre y apellidos de los alumnos que no dieron de alta numero de teléfono.
/*select nombre as 'Nombre del alumno', apellido1 as 'Primer apellido', apellido2 as 'Segundo apellido' from persona
where tipo = 'alumno' and telefono is null;*/

-- 3-Lista de alumnos nacidos en 1999
-- select * from persona where tipo = 'alumno' and  extract(year from persona.fecha_nacimiento) = 1999;

-- 4-Lista de profesores que no tinen dado de alta numero de telefono y con un nif acabado en K
-- select * from persona where tipo = 'profesor' and nif like '%K';

-- 5-Asignaturas que se imparten en el primer cuatrimestre en el tercer curso de grado con el identificador 7
-- select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;

/*6-Lista de profesores con el nombre del departamento al que estan vinulados primer apellido, segundo apellido,
 nombre, nombre del departamento en orden descendente por el nombre y los apellidos*/

/*select 
apellido1 as 'Primer apellido', 
apellido2 as 'Segundo apellido', 
persona.nombre as 'Nombre del profesor', 
departamento.nombre as 'Nombre del departamento'
from 
	persona
join
	departamento on persona.id = departamento.id
where
	persona.tipo= 'profesor' 
order by 
	persona.apellido1 desc, 
	persona.apellido2 desc, 
	persona.nombre desc;*/
    
-- 7-Lista con el nombre de las asignaturas, año de inicio y fin del curso escolar del alumno con NIF 26902806M
/*SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
FROM asignatura
JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
WHERE persona.nif = '26902806M';*/

/*8-Devuelve un listado con el nombre de todos los departamentos que tienen 
profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).*/
/*SELECT departamento.nombre
FROM departamento
WHERE EXISTS (
    SELECT 1
    FROM profesor
    JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor
    JOIN grado ON grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
    WHERE profesor.id_departamento = departamento.id
)
ORDER BY departamento.nombre;*/

/*9-Devuelve un listado con todos los alumnos que se han matriculado
 en alguna asignatura durante el curso escolar 2018/2019.*/
/*SELECT DISTINCT persona.*
FROM persona
JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id
JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE curso_escolar.id = 5
  AND persona.tipo = 'alumno'
LIMIT 0, 2000;*/

-- RESUELVE LOS SIGUIENTES EJERCICIOS UTILIZANDO LAS CLÁUSULAS LEFT JOIN Y RIGHT JOIN

-- 1
/*SELECT departamento.nombre AS nombre_departamento, persona.apellido1, persona.apellido2, persona.nombre AS nombre_profesor
FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN departamento ON departamento.id = profesor.id_departamento
ORDER BY nombre_departamento, apellido1, apellido2, nombre_profesor;*/

-- 2-Devuelve un listado con los profesores/as que no están asociados a un departamento.
/*SELECT persona.apellido1, persona.apellido2, persona.nombre AS nombre_profesor
FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
WHERE profesor.id_departamento IS NULL
ORDER BY apellido1, apellido2, nombre_profesor;*/

-- 3-Devuelve un listado con los departamentos que no tienen profesores asociados.
/*SELECT departamento.nombre AS nombre_departamento
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
WHERE profesor.id_departamento IS NULL
ORDER BY nombre_departamento;*/

-- 4-Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
/*SELECT persona.nombre AS nombre_profesor, persona.apellido1, persona.apellido2
FROM persona
LEFT JOIN asignatura ON persona.id = asignatura.id_profesor
WHERE persona.tipo = 'profesor' AND asignatura.id_profesor IS NULL
ORDER BY nombre_profesor, apellido1, apellido2;*/

-- 5-Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
/*SELECT nombre
FROM asignatura
LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor
WHERE profesor.id_profesor IS NULL
ORDER BY asignatura.nombre;*/

-- 6-Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
/*SELECT departamento.*
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
WHERE profesor.id_departamento IS NULL
ORDER BY departamento.nombre
LIMIT 3;*/

-- CONSULTAS RESUMEN

-- 1-Devuelve el numero de alumnos que hay
-- select count(*) from persona where persona.tipo = 'alumno';

-- 2-Cuantos alumnos nacieron en 1999
-- select count(*) from persona where year (fecha_nacimiento) = 1999;

-- 3-numero de profesores asociados a departamentos
/*SELECT 
departamento.nombre AS 'Nombre del departamento',
COUNT(profesor.id_profesor) AS 'Numero profesores'   
FROM
    profesor,
    departamento
WHERE
	profesor.id_departamento = departamento.id 
GROUP BY
    departamento.nombre
ORDER BY
    departamento.nombre ASC*/
   
-- 4-Listado de todos los departamentos con el numero de profesores, incluyendo departamentos sin profesores
/*SELECT 
    departamento.nombre AS 'Nombre del departamento',
    COUNT(profesor.id_profesor) AS 'Numero profesores'   
FROM
    departamento
LEFT JOIN
    profesor ON profesor.id_departamento = departamento.id
GROUP BY
    departamento.nombre
ORDER BY
    departamento.nombre ASC;*/

-- 5 lista de grados y asignaturas
/*SELECT
    grado.nombre AS 'Nombre del grado',
    COUNT(asignatura.id) AS 'Numero de asignaturas'
FROM
    grado
LEFT JOIN
    asignatura ON asignatura.id_grado = grado.id
GROUP BY
    grado.nombre
ORDER BY
    COUNT(asignatura.id) DESC;*/

-- 6-grados que tienen mas de 40 asignaturas asociadas
/*SELECT
    grado.nombre AS 'Nombre del grado',
    COUNT(asignatura.id) AS 'Numero de asignaturas'
FROM
    grado
LEFT JOIN
    asignatura ON asignatura.id_grado = grado.id
GROUP BY
    grado.nombre
HAVING
    COUNT(asignatura.id) > 40
ORDER BY
    COUNT(asignatura.id) DESC;*/
    
-- 7-grados y suma de creditos
/*SELECT
    grado.nombre AS 'Nombre del grado',
    asignatura.tipo AS 'Tipo de asignatura',
    SUM(asignatura.creditos) AS 'Suma de créditos'
FROM
    grado
JOIN
    asignatura ON asignatura.id_grado = grado.id
GROUP BY
    grado.nombre, asignatura.tipo;*/
    
-- 8-Cuantos alumnos estan matriculados en cierta asignatura
/*SELECT
    curso_escolar.anyo_inicio AS 'Año de inicio del curso escolar',
    COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) AS 'Número de alumnos matriculados'
FROM
    curso_escolar
LEFT JOIN
    alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
GROUP BY
    curso_escolar.anyo_inicio;*/
    
-- 9-Asignaturas que imparte un profesor
/*SELECT
    persona.id AS 'ID',
    persona.nombre AS 'Nombre',
    persona.apellido1 AS 'Primer Apellido',
    persona.apellido2 AS 'Segundo Apellido',
    COUNT(asignatura.id) AS 'Número de Asignaturas'
FROM
    persona
LEFT JOIN
    asignatura ON asignatura.id_profesor = persona.id
WHERE
    persona.tipo = 'profesor'
GROUP BY
    persona.id, persona.nombre, persona.apellido1, persona.apellido2
ORDER BY
    COUNT(asignatura.id) DESC;*/
    
-- 10-Devuelve todos los datos del alumno/a más joven.
-- SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');

-- 11- Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
/*SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2
FROM persona
JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
WHERE departamento.id IS NOT NULL AND asignatura.id IS NULL;*/







































