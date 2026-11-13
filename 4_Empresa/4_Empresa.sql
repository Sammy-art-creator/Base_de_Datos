CREATE TABLE departamento (
  codigo INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);


CREATE TABLE empleado (
  dni VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  salario DECIMAL(10,2) NOT NULL,
  cod_dep INT NOT NULL,
  dni_jefe VARCHAR(9),
  CONSTRAINT fk_cod_dep FOREIGN KEY (cod_dep) REFERENCES departamento(codigo),
  CONSTRAINT fk_dni_jefe FOREIGN KEY (dni_jefe) REFERENCES empleado(dni)
);

CREATE TABLE proyecto(
  codigo INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL unique,
  presupuesto DECIMAL(10,2) NOT NULL
);

CREATE TABLE participa(
  dni_emp VARCHAR(9),
  cod_proyecto INT,
  horas INT NOT NULL,
  CONSTRAINT pk_dni_pro PRIMARY KEY (dni_emp, cod_proyecto),
  CONSTRAINT fk_dni FOREIGN KEY(dni_emp) REFERENCES empleado(dni),
  CONSTRAINT fk_pro FOREIGN KEY(cod_proyecto) REFERENCES proyecto(codigo)
);
