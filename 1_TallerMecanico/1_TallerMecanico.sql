CREATE TABLE cliente (
  dni VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL
);

CREATE TABLE vehiculo(
  matricula VARCHAR(10) PRIMARY KEY,
  marca VARCHAR(50),
  modelo VARCHAR(50),
  dni_cliente VARCHAR(9) NOT NULL,
  CONSTRAINT fk_dni_cliente FOREIGN KEY (dni_cliente) REFERENCES cliente(dni)
);

CREATE TABLE reparacion(
  numero INT PRIMARY KEY,
  fecha DATE NOT NULL,
  descripcion VARCHAR(200),
  importe DECIMAL(8,2),
  matricula_vehiculo VARCHAR(10) NOT NULL,
  CONSTRAINT fk_matricula_vehiculo FOREIGN KEY (matricula_vehiculo) REFERENCES vehiculo(matricula)
);