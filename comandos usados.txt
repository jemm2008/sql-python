SELECT * FROM users
SELECT first_name, last_name from users

INSERT INTO users (first_name, last_name, handle, birthday, created_at)
VALUES ('JUAN', 'MALAVER', 'JUANCHO', '1974-12-16', NOW())

UPDATE users SET handle = 'jemm2008' WHERE id = 6

DELETE FROM users WHERE id = 6

INSERT INTO users (first_name, last_name, handle, birthday, created_at)
VALUES ('Micarol', 'SINGER', 'MiVida', '1981-05-01', NOW())

UPDATE users SET handle = 'jemm2008' WHERE id = 8
SELECT * FROM users