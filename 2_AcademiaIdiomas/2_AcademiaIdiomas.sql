CREATE TABLE alumno(
  codigo_alumno INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE profesor(
  dni VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  especialidad VARCHAR(100) NOT NULL
 );

CREATE TABLE curso(
  codigo_curso INT PRIMARY KEY,
  idioma VARCHAR(50) NOT NULL,
  nivel VARCHAR(10) NOT NULL,
  precio DECIMAL(5,2) NOT NULL,
  dni_profesor VARCHAR(9) NOT NULL,
  CONSTRAINT fk_dni_profesor FOREIGN KEY (dni_profesor) REFERENCES profesor(dni)
);

CREATE TABLE matricula(
  fecha DATE NOT NULL,
  nota DECIMAL(2,2),
  codigo_alumno INT NOT NULL,
  codigo_curso INT NOT NULL,
  CONSTRAINT pf_codigo_al_cur PRIMARY KEY (codigo_alumno, codigo_curso),
  CONSTRAINT fk_codigo_alumno FOREIGN KEY (codigo_alumno)REFERENCES alumno(codigo_alumno),
  CONSTRAINT fk_codigo_curso FOREIGN KEY (codigo_curso) REFERENCES curso(codigo_curso)
)
