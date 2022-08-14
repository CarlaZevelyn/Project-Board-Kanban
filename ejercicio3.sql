CREATE DATABASE Peluqueria_Canina_Rockett;

USE Peluqueria_canina_rockett;

CREATE TABLE Dueno (
    DNI INT NOT NULL,
    Nombre VARCHAR (40) NOT NULL,
    Apellido VARCHAR (40) NOT NULL,
    Telefono INT NOT NULL,
    Dirección VARCHAR (60) NOT NULL,
    PRIMARY KEY (DNI)
);

CREATE TABLE Perro (
    ID_Perro INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR (40) NOT NULL,
    Fecha_nacimiento DATE NOT NULL,
    Sexo CHAR NOT NULL,
    DNI_Dueno INT NOT NULL,
    PRIMARY KEY (ID_Perro),
    FOREIGN KEY (DNI_Dueno) REFERENCES Dueno (DNI)
);

CREATE TABLE Historial (
    ID_Historial INT NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Perro INT NOT NULL,
    Descripción VARCHAR (100) NOT NULL,
    Monto DECIMAL NOT NULL,
    PRIMARY KEY (ID_Historial),
    FOREIGN KEY (Perro) REFERENCES Perro (ID_Perro)
);

INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Dirección) VALUES ('28957346', 'Juan', 'Perez', '4789689', 'Belgrano 101');

INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Dirección) VALUES ('23546987', 'Maria', 'Becerra', '4789689', 'Pueyrredon  811');

INSERT INTO Perro (Nombre, Fecha_nacimiento, Sexo, DNI_dueno) VALUES ('Káiser', '2012-12-12', 'M', '28957346');

INSERT INTO Perro (Nombre, Fecha_nacimiento, Sexo, DNI_dueno) VALUES ('Leelah', '2016-06-14', 'F', '23546987');

SELECT * FROM dueno;

SELECT * FROM perro;

-- Ejercicio 3 --

DELETE FROM Perro WHERE ID_Perro IN (
    SELECT DISTINCT Perro FROM Historial WHERE EXTRACT(YEAR FROM Fecha) < 2010 
);