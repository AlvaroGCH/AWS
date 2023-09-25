/*
#1
#Como empresa, se quiere saber cual es el camping que ha obtenido una mejor valoracion general (valor medio) en su resenias, y en que provincia y ciudad se localiza. 
*/
SELECT nombre_camping, valoracion_general, ciudad_camping, com_autonoma_camping FROM campings, opiniones WHERE id_camping = id_camping_op GROUP BY valoracion_general ORDER BY valoracion_general DESC LIMIT 1;
/*
#2
#Cual es la Comunidad Autonoma en la que esta empresa tiene mas campings? Indicar cuantos son. En una sola querie.
*/
SELECT com_autonoma_camping, COUNT(id_camping) as numero_de_campings FROM campings GROUP BY com_autonoma_camping ORDER BY numero_de_campings DESC LIMIT 1;

/*
#3
#Indica cuantos trabajadores hay de cada uno de los distintos tipos de empleos que se contratan en los campings . Se debe indicar el tipo de empleo y el numero de empleados de cada tipo.
*/ 
SELECT tipo_empleo, COUNT(DNI_empleado) as numero_de_empleados FROM empleados GROUP BY tipo_empleo;

/*
#4
#El cliente con id 4 se ha mudado al mismo municipio (ciudad) en el que vive el cliente con id 5. Actualizalo en la BD.
*/
UPDATE clientes SET ciudad_cl = (SELECT ciudad_cl FROM clientes WHERE id_cliente=5) WHERE id_cliente = 4;

/*
#5
Cual es la parcela, el precio y tipo con mayor numero de reservas? 
*/
SELECT num_parcela, precio, tipo_parcela FROM parcelas, reservas WHERE num_parcela = num_parcela_res GROUP BY num_parcela_res ORDER BY COUNT(num_parcela_res) DESC LIMIT 1;

/*
#6
La empresa ha comprado un nuevo camping en Mallorca (Islas Baleares). El camping se llama 'Mahon' y se encuentra en la 'Avenida de las islas baleares, 23'. La categoria del camping es de 2 soles.

Agregalo a la base de datos.
*/
INSERT INTO campings(nombre_camping,direccion_camping,categoria_camping,ciudad_camping,com_autonoma_camping) VALUES("Mahon", "Avenida de las islas baleares, 23", 2, "Mallorca", "Islas Baleares");

/*
#7
Un cliente tiene una reclamacion sobre un camping, pero no es capaz de recordar el nombre. 

Solo sabe que se encontraba en algun punto de la 'Carrera del Riu', en Valencia, pero tampoco recuerda su numero. Cual es el nombre, la direccion, categoria, ciudad y comunidad autonoma de ese camping?
*/
SELECT nombre_camping, direccion_camping, categoria_camping, ciudad_camping, com_autonoma_camping FROM campings WHERE (ciudad_camping = "Valencia" OR com_autonoma_camping = "Valencia") AND direccion_camping LIKE "Carrera del Riu%";

/*
#8
Se quiere saber cual es el nombre y numero de trabajadores del camping que tiene mayor numero de trabajadores. Y el que menos?
*/
SELECT nombre_camping, COUNT(DNI_empleado) as numero_de_empleados FROM empleados, campings WHERE id_camping_em = id_camping GROUP BY id_camping_em ORDER BY numero_de_empleados DESC;

/*
#9
Se quiere saber el numero de parcela de tipo "bungalow" que ha estado ocupado mas dias desde que se registra en la base de datos
*/
SELECT num_parcela, SUM(dias_estancia) as tiempo FROM parcelas, reservas WHERE tipo_parcela = 'bungalow' AND num_parcela = num_parcela_res GROUP BY num_parcela ORDER BY tiempo DESC LIMIT 1;

/*
#10
Cual es el nombre del camping en el que trabaja el empleado que tiene el nombre mas largo. 
*/
SELECT nombre_camping FROM campings, empleados WHERE id_camping = id_camping_em ORDER BY MAX(nombre_empleado);

/*
#11
Cuantos campings tiene la empresa por comunidad Autonoma?
*/
SELECT com_autonoma_camping, COUNT(id_camping) as numero_de_campings  FROM campings GROUP BY com_autonoma_camping;

/*
#12
Se quiere saber el nombre del camping, y el tipo de parcela de cada una de las reservas registradas en la base de datos.
*/
SELECT nombre_camping, tipo_parcela  FROM campings, parcelas, reservas WHERE id_camping = id_camping_par AND num_parcela = num_parcela_res GROUP BY nombre_camping; 

/*
#13
Se quiere saber quien es el cliente que ha realizado la valoracion general mas positiva, para gratificar su publicacion.
*/
SELECT nombre_cliente, valoracion_general  FROM clientes, opiniones WHERE id_cliente = id_cliente_op GROUP BY id_cliente ORDER BY AVG(valoracion_general) DESC LIMIT 1;

/*
#14
Hay un cliente que sospecha que su tarjeta, con numero '4241747307190923', ha sufrido una filtracion de datos y se ha usado para realizar reservas en esta misma cadena de campings. La policia, para comprobarlo, solicita un listado con el nombre, el dni, la ciudad de residencia de los clientes que han reservado utilizando ese número de tarjeta. Obten el listado de la BD.
*/
SELECT nombre_cliente, DNI_cliente, ciudad_cl FROM clientes, reservas WHERE id_cliente = id_cliente_res AND numero_tarjeta = 4241747307190923 GROUP BY id_cliente;

/*
#15
En que comunidades autonomas diferentes tiene campings esta empresa?
*/
SELECT com_autonoma_camping FROM campings GROUP BY com_autonoma_camping; 
