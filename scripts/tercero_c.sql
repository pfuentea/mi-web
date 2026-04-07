-- =============================================================
-- Carga inicial: Apoderados y Alumnos - Tercero C
-- username = RUT alumno | password inicial = RUT alumno
-- =============================================================

BEGIN;

-- -------------------------------------------------------------
-- 1. APODERADOS (auth_user)
-- -------------------------------------------------------------
INSERT INTO auth_user (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined)
VALUES
    ('pbkdf2_sha256$1200000$EERy7yLxVnOf4IddcZPdrn$u57lVASYlO+ZrtpoyxeA0ROhCHOexwMuZx+QLHyWL08=', NULL, false, '23098061-6', 'Patricia', 'Mejias', 'contacto@tyt.cl', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$hPPxREQ8oDiyOBUdBIbrpD$Px1BScJVE/2xX0JPsfu4NOqdx+1pzUKSlWvslNHI+d8=', NULL, false, '22987429-2', 'Marcela', 'Rodriguez', 'marcelarodrirojas@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$LwhZZhNEq4z1eSMdM2n8iN$9ndoPq2nPuzdIAmjUjcjAhJA3ygq8VFkAB0H+ltLyak=', NULL, false, '23126020-K', 'Vanessa', 'Urrutia', 'urrutiav274@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$FqJgrfQhGnmgTfan1PGlLk$vSyhE0QddLMJQGHr9w4ZJqo9XuBXTj1B2tlgyjn8b+Q=', NULL, false, '23112379-2', 'Pamela', 'Parra', 'pamelaparrag@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$bgD653ki07PsK8LbIXl8cs$f2hrnemv8++4BuwW4tzxKeufjmNXs3qk2FN5YU/lEgo=', NULL, false, '23286613-6', 'Daniela', 'Sandoval', 'anitadaniela@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$mrfCbGsrjctZ8CUJKqz8Rn$gegzgPAy1mH3p2bh65fsTR409Vg3FizGWkTIQklmdZY=', NULL, false, '23205096-9', 'Jaquelina', 'Sureda', 'jaquesureda@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$0el73skGnwEG3UiodWgucx$JxqNpVoZLAxwOsPYUBi8oKFNR4kojkeXEB/havOEP7o=', NULL, false, '23012117-6', 'Charlenne', 'Gutiérrez', 'charlen_2507@hotmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$P1lHHoVXBf9fP7z9fqvjn2$H0O7eHztZmQEDTcYHM7JjdVdke9KQoOEUnnpLeoBunQ=', NULL, false, '23198068-7', 'Yasna', 'Lagos', 'yasna.lagos.lagos@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$aDTXniIWXyZWyJ1whzrYi6$DUX40BNWDfSCQE+Z6z281HHZZUKFkorg1wg+SZFnKz4=', NULL, false, '26140842-2', 'Marcia', 'Aguila', 'marciaivvette@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$NocDBzntYMTR3Lb1g8p70E$m5UWHBNb3pbsKC1ChdCuGojttrjRDLALBOSbpXqNszk=', NULL, false, '23032784-K', 'Paola', 'Morales', 'paola.moralesc2@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$1CrdvwKl84sSFhFp0jJzTZ$BwEliqYGiM/yzpLR/LGxWhjyvVCx/L3EHslnF9zB5pA=', NULL, false, '23122057-7', 'Rodrigo', 'Mondaca', 'joaquin.mondaca@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$kkxjzaAbm0eCYh6uX5Dejm$FmVjv/zZqowvegAuUqpBw6xkC2t0T71EhK/MaZK9hMU=', NULL, false, '23173399-K', 'Gladys', 'Parra', 'g.roxanaparra@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$p0LVwlg4aE6sdWQnz1tqBq$ec9ipF4wYXkU4vC9a4ZoLpG5ZKmVPMN85xGJvp7UlrY=', NULL, false, '23022105-7', 'Silvana', 'Navarrete', 'silvana.navarrete.gon@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$mHBqEtdLfvBCIv7vlUrpeV$tiMfka9YDKyg8H2HnZy/6gQ82PTsUDdWHboOaphiQpY=', NULL, false, '23198451-8', 'Sandra', 'Carrasco', 'carrascospencer1970@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$rgrnY1pjamSp62MaLFQfug$f5XR/1R43e9FiSPfTxnnbbNxsTvXScVpT3naqvIKPg0=', NULL, false, '23000571-0', 'Bernardita', 'Anjel', 'mariabernarditaanjel@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$NLdzs2dzNfjdPQygrgPgOZ$BiA/IptlkubhGL4TY1bfnPsNpjGMh9EDBGS6Ej705HI=', NULL, false, '23232453-8', 'Maria', 'Sandoval', 'marcelo.ramos@apoderados.alperit.cl', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$mAzBWbotNRWOwlFAVTjnM8$ERvwCmGeHNxErPj7t3zJ10HtvTeOmTvTe5h14Pr/iEg=', NULL, false, '22954794-1', 'Javiera', 'Agurto', 'javieraa06@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$k9srYrMFdimc1Hgbjc2v4J$C/c+bK/MLtS62kr7b3YQ9qOYmKWUOo44WTqw6KKaTVs=', NULL, false, '23145017-3', 'Norma', 'González', 'norma.gonzalez@apoderados.alperit.cl', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$h4GlOpKWmzAzQSh4coJ0I7$y8o0FDCvKgP9SW6qRUxiJckX/PSAjuaY5NcJpfvvfJg=', NULL, false, '23086171-4', 'Marcia', 'Cataldo', 'marcia.cataldo.f@gmail.com', false, true, CURRENT_TIMESTAMP),
    ('pbkdf2_sha256$1200000$4GWtbcxNgU46vnZ3Uhy4PT$RQGw6/ELQYOHcWjA2NSFYQjtILR6Bxck+OiavGwIRN4=', NULL, false, '23049141-0', 'María Jesús', 'Ramírez', 'mariaj.ramirez.o@gmail.com', false, true, CURRENT_TIMESTAMP)
ON CONFLICT (username) DO NOTHING;

-- -------------------------------------------------------------
-- 2. ALUMNOS (fondos_student)
-- -------------------------------------------------------------
INSERT INTO fondos_student (first_name, last_name, parent_id)
VALUES
    ('Maximo Alonso', 'Aguilera Mejias', (SELECT id FROM auth_user WHERE username = '23098061-6')),
    ('Monserrat Antonia', 'Barraza Rodriguez', (SELECT id FROM auth_user WHERE username = '22987429-2')),
    ('Martina Ignacia', 'Barraza Urrutia', (SELECT id FROM auth_user WHERE username = '23126020-K')),
    ('Alonso Ankatu', 'Basaez Parra', (SELECT id FROM auth_user WHERE username = '23112379-2')),
    ('Ignacio de Jesús', 'Campos Sandoval', (SELECT id FROM auth_user WHERE username = '23286613-6')),
    ('Giuliana Jaquelina', 'Campos Sureda', (SELECT id FROM auth_user WHERE username = '23205096-9')),
    ('Fernando Andrés', 'Carrasco Gutiérrez', (SELECT id FROM auth_user WHERE username = '23012117-6')),
    ('Gabriel Lucian', 'Fuentealba Lagos', (SELECT id FROM auth_user WHERE username = '23198068-7')),
    ('Gustavo Andres', 'Julio Aguila', (SELECT id FROM auth_user WHERE username = '26140842-2')),
    ('Mateo Ignacio', 'Lastarria Morales', (SELECT id FROM auth_user WHERE username = '23032784-K')),
    ('Matías Rodrigo', 'Mondaca Rojas', (SELECT id FROM auth_user WHERE username = '23122057-7')),
    ('Isidora Antonella', 'Ortiz Parra', (SELECT id FROM auth_user WHERE username = '23173399-K')),
    ('Manuel Salvador', 'Padilla Navarrete', (SELECT id FROM auth_user WHERE username = '23022105-7')),
    ('Magdalena', 'Palma Carrasco', (SELECT id FROM auth_user WHERE username = '23198451-8')),
    ('Catalina Antonieta', 'Parra Anjel', (SELECT id FROM auth_user WHERE username = '23000571-0')),
    ('Marcelo Alejandro', 'Ramos Sandoval', (SELECT id FROM auth_user WHERE username = '23232453-8')),
    ('Colomba Belén', 'Retamal Agurto', (SELECT id FROM auth_user WHERE username = '22954794-1')),
    ('Francisca Ignacia', 'Reyes González', (SELECT id FROM auth_user WHERE username = '23145017-3')),
    ('Tomás Ignacio', 'Valdés Cataldo', (SELECT id FROM auth_user WHERE username = '23086171-4')),
    ('Jesús Aramis', 'Vásquez Ramírez', (SELECT id FROM auth_user WHERE username = '23049141-0'))
ON CONFLICT DO NOTHING;

COMMIT;