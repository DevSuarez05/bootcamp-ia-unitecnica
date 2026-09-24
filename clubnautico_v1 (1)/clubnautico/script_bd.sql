-- =========================================================
-- BASE DE DATOS: CLUB NAUTICO
-- =========================================================

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS club_nautico
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE club_nautico;


-- =========================================================
-- TABLA: Socios
-- =========================================================

CREATE TABLE Socios (
    documento VARCHAR(15) NOT NULL,
    nombre VARCHAR(15) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    direccion VARCHAR(50),
    telefono VARCHAR(20),

    CONSTRAINT pk_socios
        PRIMARY KEY (documento)
) ENGINE=InnoDB;


-- =========================================================
-- TABLA: barcos
-- =========================================================

CREATE TABLE barcos (
    no_matricula INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    cuota DECIMAL(10,2),
    no_amarre INT,

    Socios_documento VARCHAR(15) NOT NULL,

    CONSTRAINT pk_barcos
        PRIMARY KEY (no_matricula),

    CONSTRAINT fk_barcos_socios
        FOREIGN KEY (Socios_documento)
        REFERENCES Socios(documento)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


-- =========================================================
-- TABLA: salidas
-- =========================================================

CREATE TABLE salidas (
    Id INT NOT NULL AUTO_INCREMENT,
    hora TIME(6),
    fecha DATE,
    destino VARCHAR(30),

    barcos_no_matricula INT NOT NULL,

    CONSTRAINT pk_salidas
        PRIMARY KEY (Id),

    CONSTRAINT fk_salidas_barcos
        FOREIGN KEY (barcos_no_matricula)
        REFERENCES barcos(no_matricula)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


-- =========================================================
-- TABLA: patron
-- =========================================================

CREATE TABLE patron (
    documento VARCHAR(15) NOT NULL,
    nombre VARCHAR(15) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    telefono VARCHAR(15),

    barcos_no_matricula INT NOT NULL,
    Socios_documento VARCHAR(15) NOT NULL,

    CONSTRAINT pk_patron
        PRIMARY KEY (documento),

    CONSTRAINT fk_patron_barcos
        FOREIGN KEY (barcos_no_matricula)
        REFERENCES barcos(no_matricula)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_patron_socios
        FOREIGN KEY (Socios_documento)
        REFERENCES Socios(documento)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;
