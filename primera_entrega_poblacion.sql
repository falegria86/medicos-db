-- Inserción de algunos valores en la tabla médico
INSERT INTO medico (id_medico, nombre, apellido_paterno, apellido_materno, createdAt, updatedAt) VALUES (19586, 'luna', 'hernandez', 'gerardo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO medico (id_medico, nombre, apellido_paterno, apellido_materno, createdAt, updatedAt) VALUES (19532, 'arteaga', 'rodríguez', 'baltazar', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO medico (id_medico, nombre, apellido_paterno, apellido_materno, createdAt, updatedAt) VALUES (38896, 'flores', 'valle', 'francisco', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO medico (id_medico, nombre, apellido_paterno, apellido_materno, createdAt, updatedAt) VALUES (106728, 'hernandez', 'alvarado', 'anabel', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Inserción en tabla estado
INSERT INTO estado (nom_estado) VALUES ('nayarit');
INSERT INTO estado (nom_estado) VALUES ('jalisco');

-- Inserción en la tabla municipio
INSERT INTO municipio (nom_municipio, fk_id_estado) VALUES ('tepic', 1);
INSERT INTO municipio (nom_municipio, fk_id_estado) VALUES ('puerto vallarta', 2);

-- Inserción en tabla colonia
INSERT INTO colonia (nom_colonia, fk_id_municipio) VALUES ('20 de noviembre', 1);
INSERT INTO colonia (nom_colonia, fk_id_municipio) VALUES ('5 de diciembre', 2);

-- Inserción tabla teléfono
INSERT INTO telefono (tipo, numero, fk_id_medico) VALUES ('C', 3112155388, 19586);
INSERT INTO telefono (tipo, numero, fk_id_medico) VALUES ('M', 3111258448, 19586);

-- Inserción tabla dias_semana
INSERT INTO dias_semana (nombre_dia) VALUES ('lunes');
INSERT INTO dias_semana (nombre_dia) VALUES ('martes');
INSERT INTO dias_semana (nombre_dia) VALUES ('miércoles');
INSERT INTO dias_semana (nombre_dia) VALUES ('jueves');
INSERT INTO dias_semana (nombre_dia) VALUES ('viernes');
INSERT INTO dias_semana (nombre_dia) VALUES ('sabado');
INSERT INTO dias_semana (nombre_dia) VALUES ('domingo');

-- Inserción tabla horario_tipo
INSERT INTO horario_tipo (tipo, descripcion) VALUES ('M', 'matutino');
INSERT INTO horario_tipo (tipo, descripcion) VALUES ('V', 'vespertino');
INSERT INTO horario_tipo (tipo, descripcion) VALUES ('B', 'mixto');
INSERT INTO horario_tipo (tipo, descripcion) VALUES ('C', 'por cita');

-- Inserción tabla horario_disponibilidad


-- Inserción tabla brick
INSERT INTO brick (num_brick) VALUES (180102);
INSERT INTO brick (num_brick) VALUES (153501);
