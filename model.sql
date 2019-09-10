-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS pabellon
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    capacidad INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS sala_paciente
(
    id BIGINT NOT NULL,
    id_paciente BIGINT,
    no_casos_año INTEGER,
    no_casos_mes INTEGER,
    religion VARCHAR(100),
    origen_etnico VARCHAR(100),
    no_dias_antes_ingreso INTEGER,
    fecha_accidente DATE,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS registro
(
    id BIGINT NOT NULL,
    id_sala_paciente BIGINT,
    id_paciente BIGINT,
    id_pabellon BIGINT,
    fecha_registro DATE,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS paciente
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    edad INTEGER,
    sexo VARCHAR(20),
    estado_civil VARCHAR(20),
    direccion_residencia VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS medicamento
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    valor INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS dieta
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    descripcion VARCHAR(200),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS examenes_medicos
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    valor INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS orden_medica
(
    id BIGINT NOT NULL,
    id_medico BIGINT,
    id_enfermedad BIGINT,
    id_medicamento BIGINT,
    cantidad_medicamento BIGINT,
    id_dieta BIGINT,
    cantidad_dieta INTEGER,
    id_examenes_medicos BIGINT,
    cantidad_examenes_medicos INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS medico
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS enfermedad
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS sala
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    id_equipo BIGINT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS equipo
(
    id BIGINT NOT NULL,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    PRIMARY KEY(id)
);


-- Create FKs
ALTER TABLE registro
    ADD    FOREIGN KEY (id_sala_paciente)
    REFERENCES sala_paciente(id)
    MATCH SIMPLE
;
    
ALTER TABLE registro
    ADD    FOREIGN KEY (id_paciente)
    REFERENCES paciente(id)
    MATCH SIMPLE
;
    
ALTER TABLE registro
    ADD    FOREIGN KEY (id_pabellon)
    REFERENCES pabellon(id)
    MATCH SIMPLE
;
    
ALTER TABLE sala_paciente
    ADD    FOREIGN KEY (id_paciente)
    REFERENCES paciente(id)
    MATCH SIMPLE
;
    
ALTER TABLE orden_medica
    ADD    FOREIGN KEY (id_enfermedad)
    REFERENCES enfermedad(id)
    MATCH SIMPLE
;
    
ALTER TABLE orden_medica
    ADD    FOREIGN KEY (id_medicamento)
    REFERENCES medicamento(id)
    MATCH SIMPLE
;
    
ALTER TABLE orden_medica
    ADD    FOREIGN KEY (id_dieta)
    REFERENCES dieta(id)
    MATCH SIMPLE
;
    
ALTER TABLE orden_medica
    ADD    FOREIGN KEY (id_examenes_medicos)
    REFERENCES examenes_medicos(id)
    MATCH SIMPLE
;
    
ALTER TABLE sala
    ADD    FOREIGN KEY (id_equipo)
    REFERENCES equipo(id)
    MATCH SIMPLE
;
    
ALTER TABLE orden_medica
    ADD    FOREIGN KEY (id_medico)
    REFERENCES medico(id)
    MATCH SIMPLE
;
    

-- Create Indexes

