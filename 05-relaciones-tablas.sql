
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.

select "Name" as "nombre",
       "Title" as "titulo"
from "Album" as a
inner join "Track" as t on a."AlbumId" = t."AlbumId" 
 ;

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select "Name" ,
       "Title" 
from "Album" as a
inner join "Artist" as a2 ON a2."ArtistId" = a."ArtistId"
order by "Name" ;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select c."FirstName",
       c."LastName",
       i."Total"
from "Invoice" i 
inner join "Customer" c ON i."CustomerId" = c."CustomerId"
order by"Total" asc 
limit 5 ;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
 
select e."FirstName"  as "empleado" ,
       c."FirstName"  as  "cliente"
from "Customer" as c
inner join "Employee" as e on c."SupportRepId" = e."EmployeeId";

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.

select i."InvoiceId"      as "id_facutra",
       il."InvoiceLineId" as  "nombre_pista"
from "Invoice" as i 
inner join "InvoiceLine" as il on i."InvoiceId" = il."InvoiceId" ;

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select a."ArtistId" as "nombre_artista" ,
       t."GenreId"  as  "genero"
from "Album" as a
inner join "Track"  as t ON a."AlbumId" = t."AlbumId";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.

select t."TrackId" as "pista",
       mt."MediaTypeId" as "medio"
from "MediaType" as mt
inner join "Track" as t ON mt."MediaTypeId" = t."MediaTypeId";

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. 
--Incluye también las pistas que no tienen un género asignado.**
/**
 * el left join combiana ambas tablas por el genero la particularidad del left join
 * es que si no hay coincidencia en una de las tablas devuelve valores null
 */
select g."GenreId" as "genero" ,
       t."TrackId" as "pista"
from "Track" as t
left join "Genre" as g on t."GenreId" = g."GenreId" 
;


-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. 
--Incluye también los clientes que no tienen ninguna factura.
/**
 * uso el concat para tener nombre y apelli separados , y tomo la columan de invoiceID como las facturas realizadas
 */
select 
      concat( c."FirstName", ' ' , c."LastName"),
      i."InvoiceId"
from "Customer" as c
left join "Invoice" i ON c."CustomerId" = i."CustomerId" ;

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. 
--Incluye también los álbumes que no tienen un artista asignado 
--(aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).

select "AlbumId" as "album",
       "Name" as "artista"
from "Album" as al
left join "Artist" as ar on al."ArtistId" = ar."ArtistId" ;

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. 
--Ordena los generos en función del número de canciones de mayor a menor.
/**
 * seleccionamos las tablas con el left que nos dara si hay nulls , por el genreId
 * Las agrupamos por el id de las canciones para que no se reptitan y despues las ordenamos
 */ 
select count("TrackId") as "cancion"
from "Track" as t
left join "Genre" as g ON t."GenreId" = g."GenreId"
group by t."TrackId"
order by count("TrackId") desc ;


--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.

select "Title" as "titulo album" ,
       sum("Milliseconds") as "duracion total"
from "Track" as t
inner join "Album" as a on a."AlbumId" = t."AlbumId" 
group by a."AlbumId" ;

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

select concat("FirstName" ,' ' , "LastName") as "nombre y apellido" ,
       sum("Total") 
from "Invoice" as i
inner join "Customer" as c on i."CustomerId" = c."CustomerId"
group by "nombre y apellido" ; 
-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. 
--Incluye también los empleados que no tienen clientes asignados.
/**
 * con el left join nos aseguramos de tener nulls en nuestra consulta 
 */
select concat(e."FirstName" , ' ' , e."LastName") as "empleado" ,
       concat(c."FirstName" , ' ' , c."LastName") as "cliente"
from "Employee" as e
left join "Customer" as c on e."EmployeeId" = c."SupportRepId" 

