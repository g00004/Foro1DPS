CREATE DATABASE IF NOT EXISTS UDB_Virtual;

USE UDB_Virtual;

CREATE TABLE IF NOT EXISTS Carrera (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_carrera VARCHAR(20),
    nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    carrera_id INT,
    FOREIGN KEY (carrera_id) REFERENCES Carrera(id)
);

CREATE TABLE IF NOT EXISTS Profesores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Materias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES Profesores(id)
);

CREATE TABLE IF NOT EXISTS Carrera_Materia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrera_id INT,
    materia_id INT,
    FOREIGN KEY (carrera_id) REFERENCES Carrera(id),
    FOREIGN KEY (materia_id) REFERENCES Materias(id)
);

CREATE TABLE IF NOT EXISTS Evaluaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha DATE,
    materia_id INT,
    FOREIGN KEY (materia_id) REFERENCES Materias(id)
);

CREATE TABLE IF NOT EXISTS Notas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT,
    evaluacion_id INT,
    nota FLOAT,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id),
    FOREIGN KEY (evaluacion_id) REFERENCES Evaluaciones(id)
);



USE UDB_Virtual;

INSERT INTO Carrera (codigo_carrera, nombre) VALUES
('C001', 'Ingeniería en Sistemas'),
('C002', 'Administración de Empresas'),
('C003', 'Derecho'),
('C004', 'Psicología'),
('C005', 'Medicina');

INSERT INTO Estudiantes (nombre, apellido, carrera_id) VALUES
('Juan', 'Perez', 1),
('María', 'González', 2),
('Carlos', 'López', 1),
('Laura', 'Martínez', 3),
('Pedro', 'Díaz', 2);

INSERT INTO Profesores (nombre, apellido) VALUES
('Ana', 'Sánchez'),
('Roberto', 'Dominguez'),
('Laura', 'Ramirez'),
('Diego', 'Hernandez'),
('Sofía', 'García');

INSERT INTO Materias (nombre, profesor_id) VALUES
('Programación I', 1),
('Contabilidad', 2),
('Derecho Constitucional', 3),
('Psicología Infantil', 4),
('Anatomía Humana', 5);

INSERT INTO Carrera_Materia (carrera_id, materia_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Evaluaciones (nombre, fecha, materia_id) VALUES
('Parcial 1', '2024-04-10', 1),
('Examen Final', '2024-05-20', 2),
('Prueba 1', '2024-04-15', 3),
('Tarea 2', '2024-04-18', 4),
('Examen 1', '2024-04-22', 5);

INSERT INTO Notas (estudiante_id, evaluacion_id, nota) VALUES
(1, 1, 85),
(2, 1, 90),
(3, 1, 75),
(4, 1, 80),
(5, 1, 95);

