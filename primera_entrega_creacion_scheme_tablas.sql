-- Creación del esquema
CREATE SCHEMA medicos DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE medicos;

-- Creación de las tablas
CREATE TABLE medico (
  id_medico INT(6) PRIMARY KEY,
  nombre VARCHAR(80) NULL,
  apellido_paterno VARCHAR(80) NULL,
  apellido_materno VARCHAR(80) NULL,
  createdAt TIMESTAMP NULL,
  updatedAt TIMESTAMP NULL
);

CREATE TABLE telefono (
  id_telefono INT PRIMARY KEY AUTO_INCREMENT,
  tipo CHAR(1) NULL COMMENT 'C: Consultorio, M: Movil',
  numero VARCHAR(10) NOT NULL,
  fk_id_medico INT(6) NOT NULL,  
  INDEX fk_telefono_medico1_idx (fk_id_medico ASC) VISIBLE,
  CONSTRAINT fk_telefono_medico1
    FOREIGN KEY (fk_id_medico)
    REFERENCES medicos.medico (id_medico)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
CREATE TABLE especialidad (
  id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
  nom_especialidad VARCHAR(80) NULL,
  codigo VARCHAR(10) NULL);
  
CREATE TABLE especialidad_medico (
  id_especialidad_medico INT PRIMARY KEY AUTO_INCREMENT,
  fk_id_medico INT(6) NOT NULL,
  fk_id_especialidad INT NOT NULL,
  INDEX fk_especialidad_medico_medico1_idx (fk_id_medico ASC) VISIBLE,
  INDEX fk_especialidad_medico_especialidad1_idx (fk_id_especialidad ASC) VISIBLE,
  CONSTRAINT fk_especialidad_medico_medico1
    FOREIGN KEY (fk_id_medico)
    REFERENCES medicos.medico (id_medico)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_especialidad_medico_especialidad1
    FOREIGN KEY (fk_id_especialidad)
    REFERENCES medicos.especialidad (id_especialidad)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
CREATE TABLE estado (
  id_estado INT PRIMARY KEY AUTO_INCREMENT,
  nom_estado VARCHAR(45) NULL);
  
CREATE TABLE municipio (
  id_municipio INT PRIMARY KEY AUTO_INCREMENT,
  nom_municipio VARCHAR(120) NULL,
  fk_id_estado INT NOT NULL,
  INDEX fk_municipio_estado1_idx (fk_id_estado ASC) VISIBLE,
  CONSTRAINT fk_municipio_estado1
    FOREIGN KEY (fk_id_estado)
    REFERENCES medicos.estado (id_estado)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
CREATE TABLE colonia (
  id_colonia INT PRIMARY KEY AUTO_INCREMENT,
  nom_colonia VARCHAR(80) NULL,
  fk_id_municipio INT NOT NULL,
  INDEX fk_colonia_municipio1_idx (fk_id_municipio ASC) VISIBLE,
  CONSTRAINT fk_colonia_municipio1
    FOREIGN KEY (fk_id_municipio)
    REFERENCES medicos.municipio (id_municipio)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
  CREATE TABLE IF NOT EXISTS horario_tipo (
  id_horario_tipo INT PRIMARY KEY AUTO_INCREMENT,
  tipo CHAR(1) NOT NULL COMMENT 'M: Matutino, V: Vespertino, B: Mixto, C: Por cita',
  descripcion VARCHAR(30));
  
  CREATE TABLE IF NOT EXISTS dias_semana (
  id_dias_semana INT PRIMARY KEY AUTO_INCREMENT,
  nombre_dia VARCHAR(15) NULL);
  
CREATE TABLE IF NOT EXISTS horario_disponibilidad (
  id_horario_disponibilidad INT PRIMARY KEY AUTO_INCREMENT,
  fk_id_horario_tipo INT NOT NULL,
  fk_id_dias_semana INT NOT NULL,
  INDEX fk_horario_disponibilidad_horario_tipo1_idx (fk_id_horario_tipo ASC) VISIBLE,
  INDEX fk_horario_disponibilidad_dias_semana1_idx (fk_id_dias_semana ASC) VISIBLE,
  CONSTRAINT fk_horario_disponibilidad_horario_tipo1
    FOREIGN KEY (fk_id_horario_tipo)
    REFERENCES medicos.horario_tipo (id_horario_tipo)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_horario_disponibilidad_dias_semana1
    FOREIGN KEY (fk_id_dias_semana)
    REFERENCES medicos.dias_semana (id_dias_semana)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
CREATE TABLE brick (
  id_brick INT PRIMARY KEY AUTO_INCREMENT,
  num_brick VARCHAR(10) NOT NULL);
  
CREATE TABLE IF NOT EXISTS medicos.domicilio (
  id_domicilio INT PRIMARY KEY AUTO_INCREMENT,
  calle VARCHAR(100) NULL,
  numero_int VARCHAR(10) NULL,
  num_ext VARCHAR(10) NULL,
  fk_id_medico INT(6) NOT NULL,
  fk_id_colonia INT NOT NULL,
  fk_id_municipio INT NOT NULL,
  fk_id_brick INT NOT NULL,
  fk_id_horario_disponibilidad INT NULL,
  INDEX fk_domicilio_colonia1_idx (fk_id_colonia ASC) VISIBLE,
  INDEX fk_domicilio_municipio1_idx (fk_id_municipio ASC) VISIBLE,
  INDEX fk_domicilio_horario_disponibilidad1_idx (fk_id_horario_disponibilidad ASC) VISIBLE,
  INDEX fk_domicilio_brick1_idx (fk_id_brick ASC) VISIBLE,
  INDEX fk_domicilio_medico1_idx (fk_id_medico ASC) VISIBLE,
  CONSTRAINT fk_domicilio_colonia1
    FOREIGN KEY (fk_id_colonia)
    REFERENCES medicos.colonia (id_colonia)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_domicilio_municipio1
    FOREIGN KEY (fk_id_municipio)
    REFERENCES medicos.municipio (id_municipio)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_domicilio_horario_disponibilidad1
    FOREIGN KEY (fk_id_horario_disponibilidad)
    REFERENCES medicos.horario_disponibilidad (id_horario_disponibilidad)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_domicilio_brick1
    FOREIGN KEY (fk_id_brick)
    REFERENCES medicos.brick (id_brick)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_domicilio_medico1
    FOREIGN KEY (fk_id_medico)
    REFERENCES medicos.medico (id_medico)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
