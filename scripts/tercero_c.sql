-- =============================================================
-- Carga inicial: Apoderados y Alumnos - Tercero C
-- username = RUT sin guión ni dígito verificador
-- password inicial = mismo que username
-- =============================================================

BEGIN;

-- -------------------------------------------------------------
-- 1. APODERADOS (auth_user)
-- -------------------------------------------------------------
INSERT INTO auth_user (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined)
VALUES
    ('pbkdf2_sha256$1200000$K1ZtCiMjYKBohFzhvOKJRC$sndyWCZHHcWMIdkGUfm8gM90VfJnY6AO+iiF04W41wc=', NULL, false, '23098061', 'Patricia', 'Mejias', 'contacto@tyt.cl', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$lBrdfbSIxuM6N08NFNR7Gk$k7hyB1377kfVGjr2aYjeT0fExfpcuVzUeD3GxkwxiwU=', NULL, false, '22987429', 'Marcela', 'Rodriguez', 'marcelarodrirojas@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$9AMC4eQxFmEQIcHDCAvetk$Ijj3xeHDyFu0OTJM79F0gzu+MOcjTq6t4oOOEkHqTf8=', NULL, false, '23126020', 'Vanessa', 'Urrutia', 'urrutiav274@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$Hk1ZVCxfi5p4lGvtQPCihE$pWqpWJi01zeTCIQ2GISpI4aILGgwjhICbhmmREFSa+4=', NULL, false, '23112379', 'Pamela', 'Parra', 'pamelaparrag@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$UkmbHy6VB4LoWe68jeYF5y$qWj1lqOiGi3nZVrO0avijD/dK7McDZzyvROj7iv4yaU=', NULL, false, '23286613', 'Daniela', 'Sandoval', 'anitadaniela@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$EzFhgxULVIulmvdYN3JOZk$vnC/YV+o0iWsz6vguBvrwgUcmwVidUFv7PwP4Y7PgQw=', NULL, false, '23205096', 'Jaquelina', 'Sureda', 'jaquesureda@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$hQj4f7txgNkLn0wYKKeUvP$Ai/V4nIn0CJUhfqu0w6QShDDqmyywsDzLxvB9aXIEpo=', NULL, false, '23012117', 'Charlenne', 'Gutiérrez', 'charlen_2507@hotmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$XH4q6Us4RNSNANwZLeEizW$TApUS7kL2/4xTcfak/pmuwweT5/iYY7D1kbfrXxF9eY=', NULL, false, '23198068', 'Yasna', 'Lagos', 'yasna.lagos.lagos@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$yq3NCcQ9MfrmgQdGaDO5WA$pBJYI6pgxBYroZsNicbFRh77e51wQ0po8M5y08OLxVc=', NULL, false, '26140842', 'Marcia', 'Aguila', 'marciaivvette@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$OnvucDuUkgTiRJ7nYGEt7v$tK2jxmUOIZk1sS28lNQ8lxE+joVl6yvA2vZ7Wukaork=', NULL, false, '23032784', 'Paola', 'Morales', 'paola.moralesc2@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$RhriPI62c64JrCn5kq7luv$n/d7dBzNxX6zFN0KJVaeGYmpg1K+RPll3MAbkXnhoQg=', NULL, false, '23122057', 'Rodrigo', 'Mondaca', 'joaquin.mondaca@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$2LwdcCnwEABBG3EYT94hIH$DC/pxtYPq6SZgoIbjDaSp5txuOYTDyITmUBW7T9KizQ=', NULL, false, '23173399', 'Gladys', 'Parra', 'g.roxanaparra@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$D15we6AVaKOjFygSsHcbrB$OMutvuTWr9BGSzTEDIBU0rXVScE2k9wGo+totIxcVkY=', NULL, false, '23022105', 'Silvana', 'Navarrete', 'silvana.navarrete.gon@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$TxpXKRqMYYEFOsE890tqwm$VVd7ZZaqQmOGPfo954mEK06/Bavrz9kMv4P5YXUiV2k=', NULL, false, '23198451', 'Sandra', 'Carrasco', 'carrascospencer1970@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$AeXOeVc4ZT6aKm30r8U6dY$AHPx/7l52olfbBjgfhSCjc6m2pPvJ5iL+5Jaaf6ufzs=', NULL, false, '23000571', 'Bernardita', 'Anjel', 'mariabernarditaanjel@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$ve6VJtG8vAiAacGmOpVibm$JCqBa3cocVyvtcoNo+S8eQ5kVimasmTLA5ZBLW7nlqE=', NULL, false, '23232453', 'Maria', 'Sandoval', 'marcelo.ramos@apoderados.alperit.cl', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$lqW6lC1UtQolQaKihvBb5y$Ya4Cbtcz6FldK8ZkIBi54lHIT/2J3Jj0JOuVDRw+HzI=', NULL, false, '22954794', 'Javiera', 'Agurto', 'javieraa06@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$dDAOs5nYqF9PDlD2TrUPXE$cCcm+T5To0rzQwx0iDEj6QVq/colxF2iG89K3L0neM4=', NULL, false, '23145017', 'Norma', 'González', 'norma.gonzalez@apoderados.alperit.cl', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$PAgAAl1xaoVTCnUfctz7HI$Z9jEF1ckuEIJCnJq5gkkDVQJez59MiSU0tcU7y/pW84=', NULL, false, '23086171', 'Marcia', 'Cataldo', 'marcia.cataldo.f@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$D0VXGYE4V8Sga9KVL0Mqkz$vGXjWedWLUGZSDFQbAdcEsBjxjU6mtIqjcEGwdUgKVA=', NULL, false, '23049141', 'María Jesús', 'Ramírez', 'mariaj.ramirez.o@gmail.com', false, true, CURRENT_TIMESTAMP)
ON CONFLICT (username) DO NOTHING;

-- -------------------------------------------------------------
-- 2. ALUMNOS (fondos_student)
-- -------------------------------------------------------------
INSERT INTO fondos_student (first_name, last_name, parent_id)
VALUES
    ('Maximo Alonso', 'Aguilera Mejias', (SELECT id FROM auth_user WHERE username = '23098061')),
    ('Monserrat Antonia', 'Barraza Rodriguez', (SELECT id FROM auth_user WHERE username = '22987429')),
    ('Martina Ignacia', 'Barraza Urrutia', (SELECT id FROM auth_user WHERE username = '23126020')),
    ('Alonso Ankatu', 'Basaez Parra', (SELECT id FROM auth_user WHERE username = '23112379')),
    ('Ignacio de Jesús', 'Campos Sandoval', (SELECT id FROM auth_user WHERE username = '23286613')),
    ('Giuliana Jaquelina', 'Campos Sureda', (SELECT id FROM auth_user WHERE username = '23205096')),
    ('Fernando Andrés', 'Carrasco Gutiérrez', (SELECT id FROM auth_user WHERE username = '23012117')),
    ('Gabriel Lucian', 'Fuentealba Lagos', (SELECT id FROM auth_user WHERE username = '23198068')),
    ('Gustavo Andres', 'Julio Aguila', (SELECT id FROM auth_user WHERE username = '26140842')),
    ('Mateo Ignacio', 'Lastarria Morales', (SELECT id FROM auth_user WHERE username = '23032784')),
    ('Matías Rodrigo', 'Mondaca Rojas', (SELECT id FROM auth_user WHERE username = '23122057')),
    ('Isidora Antonella', 'Ortiz Parra', (SELECT id FROM auth_user WHERE username = '23173399')),
    ('Manuel Salvador', 'Padilla Navarrete', (SELECT id FROM auth_user WHERE username = '23022105')),
    ('Magdalena', 'Palma Carrasco', (SELECT id FROM auth_user WHERE username = '23198451')),
    ('Catalina Antonieta', 'Parra Anjel', (SELECT id FROM auth_user WHERE username = '23000571')),
    ('Marcelo Alejandro', 'Ramos Sandoval', (SELECT id FROM auth_user WHERE username = '23232453')),
    ('Colomba Belén', 'Retamal Agurto', (SELECT id FROM auth_user WHERE username = '22954794')),
    ('Francisca Ignacia', 'Reyes González', (SELECT id FROM auth_user WHERE username = '23145017')),
    ('Tomás Ignacio', 'Valdés Cataldo', (SELECT id FROM auth_user WHERE username = '23086171')),
    ('Jesús Aramis', 'Vásquez Ramírez', (SELECT id FROM auth_user WHERE username = '23049141'))
ON CONFLICT DO NOTHING;

COMMIT;