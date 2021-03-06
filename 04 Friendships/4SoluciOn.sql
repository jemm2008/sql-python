/* PARTE A
Usando el siguiente ERD como referencia, escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.*/
#
SELECT u.id, CONCAT(u.first_name, '  ', u.last_name) AS Usuario, CONCAT(amigos.first_name, '  ', amigos.last_name) AS Amigo FROM  friendships f
LEFT JOIN users u ON f.user_id = u.id
LEFT JOIN users as amigos on f.friend_id = amigos.id;
#
/* EJERCICIO 01
Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.*/
#
SELECT u.id, CONCAT(u.first_name, '  ', u.last_name) AS Usuario, CONCAT(amigos.first_name, '  ', amigos.last_name) AS Amigo FROM  friendships f
LEFT JOIN users u ON f.user_id = u.id
LEFT JOIN users as amigos on f.friend_id = amigos.id
WHERE amigos.first_name = 'Kermit';
#
/* EJERCICIO 02
Devuelve el recuento de todas las amistades.*/
#
SELECT COUNT(f.id) as relacion_amistades FROM friendships f;
#
/* EJERCICIO 03
Descubre quién tiene más amigos y devuelve el recuento de sus amigos.*/
#
SELECT u.id, CONCAT(u.first_name, '  ', u.last_name) AS Usuario, COUNT(f.friend_id) FROM friendships f
LEFT JOIN users u ON f.user_id = u.id
GROUP BY u.id
ORDER BY COUNT(f.friend_id) DESC
LIMIT 1;
#
/* EJERCICIO 04
Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.*/
# NEW USER
INSERT INTO users (first_name, last_name, created_at) 
VALUES('JuanEnrique', 'Malaver', NOW());
# NEW FRIENDSHIPS
INSERT INTO friendships (user_id, friend_id, created_at) 
VALUES('6', '2',NOW()), ('6', '4',NOW()), ('6', '5',NOW());
#
/* EJERCICIO 05
Devuelve a los amigos de Eli en orden alfabético.*/
#
SELECT u.id, CONCAT(u.first_name, '  ', u.last_name) AS Usuario, CONCAT(amigos.first_name, '  ', amigos.last_name) AS Amigo FROM  friendships f
LEFT JOIN users u ON f.user_id = u.id
LEFT JOIN users as amigos on f.friend_id = amigos.id
WHERE CONCAT(u.first_name, '  ', u.last_name) = 'Eli  Byers'
ORDER BY CONCAT(amigos.first_name, '  ', amigos.last_name) ASC;
#
/*EJERCICIO 06
Eliminar a Marky Mark de los amigos de Eli.*/
# CONSULTING....
SELECT u.id, CONCAT(u.first_name, '  ', u.last_name) AS Usuario, friend_id, CONCAT(amigos.first_name, '  ', amigos.last_name) AS Amigo FROM  friendships f
LEFT JOIN users u ON f.user_id = u.id
LEFT JOIN users as amigos on f.friend_id = amigos.id
WHERE CONCAT(u.first_name, '  ', u.last_name) = 'Eli  Byers';
# DELETE INSTRUCTIONS....
DELETE FROM friendships WHERE user_id = 2 AND friend_id = 5;
#
/*EJERCICIO 07
Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos*/
#
SELECT CONCAT(u.first_name, '  ', u.last_name) AS Usuario, CONCAT(amigos.first_name, '  ', amigos.last_name) AS Amigo FROM  friendships f
LEFT JOIN users u ON f.user_id = u.id
LEFT JOIN users as amigos on f.friend_id = amigos.id;
#