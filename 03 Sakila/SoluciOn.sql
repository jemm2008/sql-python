/* PREGUNTA 01
¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312?
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente */
#
SELECT city.city_id, cus.first_name, cus.last_name, cus.email, adr.address, adr.address2, adr.postal_code, city.city, adr.district, country.country FROM customer cus
JOIN address adr ON adr.address_id = cus.address_id
JOIN city ON city.city_id = adr.city_id
JOIN country ON country.country_id = city.country_id
WHERE adr.city_id = 312;
#
/* PREGUNTA 02
¿Qué consulta harías para obtener todas las películas de comedia?
Su consulta debe devolver el título de la película, la descripción, el año de estreno,
la calificación, las características especiales y el género (categorIa). */
#
SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, cat.name AS GEnero FROM category cat
JOIN film_category fcat ON fcat.category_id = cat.category_id
JOIN film f ON f.film_id = fcat.film_id
WHERE CAT.name = 'Comedy';
#
/* PREGUNTA 03
¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5?
Su consulta debe devolver la identificación del actor, el nombre del actor,
el título de la película, la descripción y el año de lanzamiento. */
#
SELECT a.actor_id, a.first_name, a.last_name, f.title, f.description, f.release_year FROM actor a
JOIN film_actor ON a.actor_id = film_actor.actor_id
JOIN film f ON f.film_id = film_actor.film_id
WHERE a.actor_id = 5;
#
/* PREGUNTA 04
¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)?
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente. */
#
SELECT store.store_id, c.city_id, CONCAT(cus.first_name, '  ', cus.last_name) AS Costumers_Name, cus.email, adr.address, c.city FROM store
JOIN customer cus ON cus.store_id = store.store_id
JOIN address adr ON adr.address_id = cus.address_id
JOIN city c ON c.city_id = adr.city_id
WHERE store.store_id = 1 AND (c.city_id = 1 OR c.city_id = 42 OR c.city_id = 312 OR c.city_id = 459);
#
/* PREGUNTA 05
¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y
"característica especial = detrás de escena", unidas por actor_id = 15?
Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y las características especiales.
Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'. */
#
SELECT a.actor_id, f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
WHERE a.actor_id = 15 AND f.rating = 'G' AND f.special_features LIKE '%Behind%';
#
/* PREGUNTA 06
¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369?
Su consulta debe devolver film_id, title, actor_id y actor_name. */
#
SELECT f.film_id, f.title, a.actor_id, CONCAT(a.first_name,'  ', a.last_name) AS Actors_Name FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
WHERE f.film_id = 369;
#
/* PREGUNTA 07
¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99?
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
las características especiales y el género (categoría). */
#
SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, cat.name AS GEnero, f.rental_rate 
FROM category cat
JOIN film_category fcat ON fcat.category_id = cat.category_id
JOIN film f ON f.film_id = fcat.film_id
WHERE cat.name = 'Drama' AND rental_rate = 2.99;
#
/* PREGUNTA 08
¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER?
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
las características especiales, el género (categoría) y el nombre y apellido del actor. */
#
SELECT a.actor_id, CONCAT(a.first_name,'  ', a.last_name) AS Actors_Name, f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, cat.name AS GEnero
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
JOIN film_category fcat ON fcat.film_id = f.film_id
JOIN category cat ON cat.category_id = fcat.category_id
WHERE cat.name = 'Action' AND a.first_name = 'SANDRA' AND a.last_name = 'KILMER';
#