DROP DATABASE IF EXISTS barberia_db;
CREATE DATABASE barberia_db;
USE barberia_db;

CREATE TABLE tipo_documento (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    sigla VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    telefono VARCHAR(10),
    correo VARCHAR(100),
    notas TEXT
);

CREATE TABLE barbero (
    id_barbero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    especialidad VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(8,2) NOT NULL
);

CREATE TABLE horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_barbero INT,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_barbero) REFERENCES barbero(id_barbero)
);

CREATE TABLE citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_barbero INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado VARCHAR(50) DEFAULT 'pendiente',
    observaciones TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_barbero) REFERENCES barbero(id_barbero),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT,
    metodo_pago VARCHAR(50),
    monto DECIMAL(8,2),
    pagado BOOLEAN DEFAULT FALSE,
    fecha_pago DATE,
    FOREIGN KEY (id_cita) REFERENCES citas(id_cita)
);
