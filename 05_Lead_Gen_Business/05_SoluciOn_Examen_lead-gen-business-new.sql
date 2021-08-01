/* CONSULTA 01
¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012? */
#
SELECT MONTHNAME(charged_datetime) AS 'MES', SUM(amount) AS Ingresos_Totales from billing
WHERE charged_datetime >= '2012-03-01 00:00:00' AND charged_datetime <= '2012-03-31 23:59:59'
GROUP BY MONTHNAME(charged_datetime);
#
/* CONSULTA 02
¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2? */
#
SELECT c.client_id AS cliente, SUM(amount) AS Ingresos_Totales from billing b
JOIN clients c ON b.client_id = c.client_id
WHERE c.client_id = 2;
#
/* CONSULTA 03
¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10? */
#
SELECT c.client_id, s.domain_name FROM sites s
JOIN clients c ON s.client_id = c.client_id
WHERE c.client_id = 10;
#
/* CONSULTA 04
¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? */
#
SELECT c.client_id, MONTHNAME(s.created_datetime) AS 'MES', YEAR(s.created_datetime) AS 'AÑO', COUNT(s.site_id) AS 'Number_of_SiteS' FROM clients c
LEFT JOIN sites s ON c.client_id = s.client_id
WHERE c.client_id = 1
GROUP BY YEAR(s.created_datetime), MONTHNAME(s.created_datetime);
#
/* ¿Qué pasa con el cliente = 20? */
#
SELECT c.client_id, MONTHNAME(s.created_datetime) AS 'MES', YEAR(s.created_datetime) AS 'AÑO', COUNT(s.site_id) AS 'Number_of_SiteS' FROM clients c
LEFT JOIN sites s ON c.client_id = s.client_id
WHERE c.client_id = 20
GROUP BY YEAR(s.created_datetime), MONTHNAME(s.created_datetime);
#
/* CONSULTA 05
¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios
entre el 1 de enero de 2011 y el 15 de febrero de 2011? */
#
SELECT s.site_id, s.domain_name AS sitio_WEB, COUNT(l.leads_id) AS leads, DATE_FORMAT(l.registered_datetime, '%M %D %Y') AS Fecha  FROM  sites s
JOIN leads l ON s.site_id = l.site_id
WHERE l.registered_datetime >= '2011-01-01 00:00:00' AND l.registered_datetime <= '2011-02-15 23:59:59'
GROUP BY l.leads_id;
#
/* CONSULTA 06
¿Qué consulta ejecutaría para obtener una lista de nombres de clientes,
y el número total de clientes potenciales que hemos generado para cada uno de nuestros clientes,
entre el 1 de enero de 2011 y el 31 de diciembre de 2011? */
#
SELECT c.client_id, CONCAT(c.first_name, '  ', c.last_name) AS Client_Name_List, COUNT(l.leads_id) AS leads FROM  clients c
JOIN sites s ON s.client_id = c.client_id
JOIN leads l ON l.site_id = s.site_id
WHERE l.registered_datetime >= '2011-01-01 00:00:00' AND l.registered_datetime <= '2011-12-31 23:59:59'
GROUP BY c.client_id;
#
/* CONSULTA 07
¿Qué consulta ejecutaría para obtener una lista de nombres de clientes,
y el número total de clientes potenciales que hemos generado para cada cliente,
cada mes entre los meses 1 y 6 del año 2011? */
#
SELECT c.client_id, CONCAT(c.first_name, '  ', c.last_name) AS Client_Name_List, MONTHNAME(l.registered_datetime) AS 'MES', COUNT(l.leads_id) AS leads FROM  clients c
JOIN sites s ON s.client_id = c.client_id
JOIN leads l ON l.site_id = s.site_id
WHERE l.registered_datetime >= '2011-01-01 00:00:00' AND l.registered_datetime <= '2011-06-30 23:59:59'
GROUP BY c.client_id, MONTHNAME(l.registered_datetime)
ORDER BY c.client_id, MES ASC;
#
/* CONSULTA 08
¿Qué consulta ejecutaría para obtener una lista de nombres de clientes,
y el número total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes,
entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente.
Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento. */
#
# Leads año 2011 .-
SELECT c.client_id, CONCAT(c.first_name, '  ', c.last_name) AS Client_Name, s.domain_name, COUNT(l.leads_id) AS Leads FROM  leads l
JOIN sites s ON l.site_id = s.site_id
JOIN clients c ON c.client_id = s.client_id
WHERE l.registered_datetime >= '2011-01-01 00:00:00' AND l.registered_datetime <= '2011-12-31 23:59:59'
GROUP BY c.client_id, s.domain_name;
#
# Leads en TODO MOMENTO .-
SELECT c.client_id, CONCAT(c.first_name, '  ', c.last_name) AS Client_Name, s.domain_name, COUNT(l.leads_id) AS Leads FROM  leads l
JOIN sites s ON l.site_id = s.site_id
RIGHT JOIN clients c ON c.client_id = s.client_id
GROUP BY c.client_id, s.domain_name;
#
/* CONSULTA 09
Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente. */
#
SELECT c.client_id, CONCAT(c.first_name, '  ', c.last_name) AS Client_Name, SUM(amount) AS Ingresos_Totales, MONTHNAME(charged_datetime) AS 'MES', YEAR(charged_datetime) AS 'AÑO' FROM billing b
JOIN clients c ON b.client_id = c.client_id
GROUP BY c.client_id, MES, AÑO, MONTH(charged_datetime)
ORDER BY c.client_id ASC, AÑO ASC, MONTH(charged_datetime) ASC;
#
/* CONSULTA 10
Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente.
Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT) */
#
SELECT c.client_id, CONCAT(c.first_name, '  ', c.last_name) AS Client_Name, GROUP_CONCAT(s.domain_name) AS SitioS FROM sites s
RIGHT JOIN clients c ON c.client_id = s.client_id
GROUP BY c.client_id, Client_Name;
#