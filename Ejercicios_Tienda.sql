/*1-nombre de productos que hay en la tabla producto*/
-- select nombre from tiendadb.producto;

/*2-nombres y precios de la tabla producto*/
-- select nombre, precio from tiendadb.producto;

/*3-todas las comunas de la tabla producto*/
-- select * from producto

/*4-producto, precio euros, precio dolares*/
-- select nombre, precio, precio * 1.2 as precioDolares from producto;

/*5-usa alias columnas nombre del producto, precio en euros, precio en dolares*/
-- select nombre as 'Nombre Del Producto', precio as 'Precio Del Producto', precio * 1.2 as 'Precio En Dolares' from producto;

/*6-Nombres y precios de la tabla producto, todos los nombres en mayuscula*/
-- select upper(nombre) as 'Nombres en Mayusculas', precio as 'Precio en euros' from producto;

/*7-nombres y precios, nombres en minuscula*/
-- select lower(nombre) as 'Nombres en Mayusculas', precio as 'Precio en euros' from producto;

/*8-nombres fabricantes + nombres fabricantes con las primeras dos letras en mayusculas*/
-- SELECT CONCAT(UPPER(SUBSTRING(nombre, 1, 2)), SUBSTRING(nombre, 3)) AS 'MAyuscula_Fabricantes' FROM fabricante;

/*9-redodenado precios tabla producto*/
-- SELECT ROUND(precio, 1) AS precio_redondeado FROM producto;

/*10-precios productos sin decimales*/
-- SELECT ROUND(precio, 0) AS precio_redondeado FROM producto;

/*11-fabricantes que tienen productos en la tabla producto*/
-- select fabricante_idfabricante from producto;

/*12-fabricantes en la tabla producto sin repetir*/
-- SELECT DISTINCT fabricante_idfabricante FROM producto;

/*13-lista de fabricantes en orden ascendente*/
-- SELECT nombre FROM fabricante ORDER BY idfabricante ASC;

/*14-lista de fabricantes en orden descendente*/
-- SELECT nombre FROM fabricante ORDER BY idfabricante DESC;

/*15-nombre de los productos en orden ascendente y descendente*/
/*SELECT a.nombre AS 'Orden Ascendente', b.nombre AS 'Orden Descendente'
FROM (
    SELECT nombre, ROW_NUMBER() OVER (ORDER BY nombre ASC) AS rn
    FROM fabricante
) a
JOIN (
    SELECT nombre, ROW_NUMBER() OVER (ORDER BY nombre DESC) AS rn
    FROM fabricante
) b ON a.rn = b.rn;*/

/*16-5 primeras filas de la columna fabricante*/
-- SELECT * FROM fabricante LIMIT 5;

/*17-devuelve dos filas a partir de la cuarta de la tabla fabricante*/
-- SELECT * FROM fabricante LIMIT 3, 2;

/*18-nombre y precio del producto más barato*/
-- select nombre, precio from producto order by precio asc limit 1;

/*19-nombre y precio del producto más caro*/
-- select nombre, precio from producto order by precio desc limit 1;

/*20-Todos los productos del fabricante con id 2*/
-- select * from producto where fabricante_idfabricante = 2;

/*21-llamar lista de productos con nombre, precio y nombre del fabricante*/
-- select producto.nombre as 'Nombre del producto', producto.precio as 'Precio en Euros', fabricante.nombre as 'Nombre del Fabricante' from producto
-- join fabricante on producto.fabricante_idfabricante = fabricante.idfabricante;

/*22-Ordenar la lista anterior en orden alfabetico*/
/*select producto.nombre as 'Nombre del producto', producto.precio as 'Precio en Euros', fabricante.nombre as 'Nombre del Fabricante' from producto
join fabricante on producto.fabricante_idfabricante = fabricante.idfabricante
order by fabricante.nombre asc;*/

/*23-devolver una lista con codigo del producto, nombre del producto, codigo del fabricador, nombre del fabricador*/
/*select producto.idproducto as 'Codigo del producto', producto.nombre as 'Nombre del producto', fabricante.idfabricante as 'Codigo del fabricante' , fabricante.nombre as 'Nombre del fabricante'
from producto
join fabricante on producto.fabricante_idfabricante = fabricante.idfabricante;*/

/*24-devolver nombre del producto, su precio, nombre del fabricante del producto mas barato*/
/*SELECT producto.nombre AS 'Nombre del producto', producto.precio AS 'Precio del producto', fabricante.nombre AS 'Nombre del fabricante'
FROM producto 
JOIN fabricante ON producto.fabricante_idfabricante = fabricante.idfabricante
ORDER BY producto.precio ASC
LIMIT 1;*/

/*25-devolver nombre del producto, su precio, nombre del fabricante del producto mas caro*/
/*SELECT producto.nombre AS 'Nombre del producto', producto.precio AS 'Precio del producto', fabricante.nombre AS 'Nombre del fabricante'
FROM producto 
JOIN fabricante ON producto.fabricante_idfabricante = fabricante.idfabricante
ORDER BY producto.precio desc
LIMIT 1;*/

/*26-Retorna todos los productos del fabricante Lenovo*/
-- select * from producto where fabricante_idfabricante = 7;

/*27-Retorna un lista de los productos de los fabricantes que tengan un precio mayor a 200*/
-- select * from producto where precio > 200;

/*28-devolver un listado de los productos CocaCola y mango sin utilizar el operador in */
/*select * from producto 
join fabricante on producto.fabricante_idfabricante = fabricante.idfabricante
where fabricante.nombre = 'CocaCola' or fabricante.nombre = 'Mango';*/

/*29-devolver un listado de los productos CocaCola y mango utilizando el operador in*/
/*SELECT * FROM producto
WHERE fabricante_idfabricante IN (
    SELECT idfabricante FROM fabricante
    WHERE nombre = 'CocaCola' OR nombre = 'Mango'
);*/

/*30-Devolver un listado del nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe con la letra e*/
/*select producto.nombre, producto.precio
from producto
join fabricante on producto.fabricante_idfabricante = fabricante.idfabricante
where fabricante.nombre like '%e';*/

/*31-devolver los nombres y el precio de los productos de los fabricantes cuyo nombre contenga una w*/
/*SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.fabricante_idfabricante = fabricante.idfabricante
WHERE fabricante.nombre LIKE '%w%';*/

/*32-Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).*/
/*SELECT producto.nombre AS 'Nombre del producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del fabricante'
FROM producto
JOIN fabricante ON producto.fabricante_idfabricante = fabricante.idfabricante
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;*/

/*33-Devuelve un listado con el código y el nombre de fabricante, solo de aquellos fabricantes que tienen productos asociados en la base de datos*/
/*SELECT fabricante.idfabricante AS 'Código del fabricante', fabricante.nombre AS 'Nombre del fabricante'
FROM fabricante
JOIN producto ON fabricante.idfabricante = producto.fabricante_idfabricante
GROUP BY fabricante.idfabricante, fabricante.nombre;*/

/*34-incluyebdo los no asociados*/
/*SELECT fabricante.idfabricante AS 'Código del fabricante', fabricante.nombre AS 'Nombre del fabricante'
FROM fabricante
LEFT JOIN producto ON fabricante.idfabricante = producto.fabricante_idfabricante
GROUP BY fabricante.idfabricante, fabricante.nombre;*/

/*35-Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.*/
/*SELECT idfabricante AS 'Código del fabricante', nombre AS 'Nombre del fabricante'
FROM fabricante
WHERE idfabricante NOT IN (
    SELECT DISTINCT fabricante_idfabricante
    FROM producto
)*/

/*36-Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
/*SELECT * FROM producto
WHERE fabricante_idfabricante = (
    SELECT idfabricante
    FROM fabricante
    WHERE nombre = 'Lenovo'
)*/

/*37-Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).*/
/*SELECT * FROM producto
WHERE precio = (
    SELECT MAX(precio) FROM producto
    WHERE fabricante_idfabricante = (
        SELECT idfabricante FROM fabricante WHERE nombre = 'Lenovo'
    )
)*/

/*38-Producto mas caro producido por lenovo*/
/*SELECT nombre FROM producto
WHERE fabricante_idfabricante = (
    SELECT idfabricante FROM fabricante
    WHERE nombre = 'Lenovo'
)
ORDER BY precio DESC LIMIT 1*/

/*39-Producto mas barato producido por Apple*/
/*SELECT nombre FROM producto
WHERE fabricante_idfabricante = (
    SELECT idfabricante FROM fabricante
    WHERE nombre = 'Apple'
)
ORDER BY precio ASC LIMIT 1*/

/*40-Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.*/
/*SELECT * FROM producto
WHERE precio >= (
    SELECT MAX(precio) FROM producto WHERE fabricante_idfabricante = (
        SELECT idfabricante FROM fabricante WHERE nombre = 'Lenovo'
    )
);*/

/*41-Lista todos los productos del fabricante Toyota que tienen un precio superior al precio medio de todos sus productos.*/
/*SELECT * FROM producto
WHERE fabricante_idfabricante = (
    SELECT idfabricante FROM fabricante WHERE nombre = 'Toyota'
)
AND precio > (
    SELECT AVG(precio) FROM producto WHERE fabricante_idfabricante = (
        SELECT idfabricante FROM fabricante WHERE nombre = 'Toyota'
    )
);*/
