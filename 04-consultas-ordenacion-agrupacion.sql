
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
/**
 * De base la funcion order by lo hace ascendente
 */
select ("Name") 
from "Track"
order by  "Name" ;

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
/** 
 * he intentado agrupar la casilla de album , luego contarlos y los ordeno de mayor a menor con el limite de 1
 * pero algo falla
 */
select count("AlbumId")
from "Track" 
group by "AlbumId"
order by "AlbumId" desc
limit 1;

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.

select 
"Composer" ,
avg ("Milliseconds") ,
stddev("Milliseconds"),
variance("Milliseconds") 
from "Track" 
group by "Composer" ;

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.

   select "Name" ,
          "UnitPrice" 
   from "Track" 
   limit 10 ;

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
/**
 * pongo tambien el id visible para confirmalo , si se desea eliminar
 * se borra la segunda linea del "selec"
 */
  select "LastName" ,
         "EmployeeId" 
  from "Employee" 
  order by "EmployeeId" desc ;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
 /**
  * he intentado contar los distintos con distinct tomando ambas listas con un inner join 
  */
 select count(distinct g."GenreId") 
 from "Track" as t
 inner join "Genre" as g  on t."GenreId" = g."GenreId" ;
 

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
/**
 * al no espeficiar se hace ascedente
 */
select "FirstName" as "nombre",
       "Country"   as "País"
from "Customer" c 
order by "nombre"
limit 5 ;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.

select count("Country") ,
        "Country" 
from "Customer" c 
group by "Country" ;

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.

select 
sum("Total"),
"BillingCountry" 
from "Invoice"
group by "BillingCountry" 
having count("Total") >10 ;

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
/** es como el ejemplo de explicacion de group by
 * 
 */
select 
"BillingCountry" ,
count("CustomerId") 
from "Invoice" i 
group by "BillingCountry"
order by count("CustomerId") > 5 ;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
   /**
    * inconcluso , no consigo encontrar en que fallo
    */
select count("mt.MediaTypeId") 
from "Track" as t
inner join "MediaType" as mt ON t."MediaTypeId" = mt."MediaTypeId"
group by "MediaTypeId" 
having count("MediaTypeId")>250000
; 



-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
  /** 
   * pense que el where no iba con group pero si pongo having no funciona
   */ 
select "Country" ,
       count("CustomerId")
from "Customer" 
where "SupportRepId" < 5
group by "Country" ;
 ;


-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
  
select  
"BillingPostalCode",
 count("CustomerId")
from "Invoice" 
where "CustomerId" > 5 
group by "BillingPostalCode" 
order by "BillingPostalCode"
; 

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) 
--donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. 
--Muestra el tipo de medio y el número total de pistas.

select 
count(distinct ("MediaTypeId")),
"UnitPrice" 
from "Track" t 
where "UnitPrice" > 0.99 and "Milliseconds" > 200000
group by "UnitPrice" 
;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 
--y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.

select 
/** 
 * aunque salga null es state no sale en country por lo que el codigo cumple
 */
"Country",
       "State" ,
       count("CustomerId")
from "Customer" 
where "SupportRepId" > 3
and "Company" notnull 
group by "Country" , "State" ;







