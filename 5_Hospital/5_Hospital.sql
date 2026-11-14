CREATE TABLE personal(
  dni VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL UNIQUE,
  tipo VARCHAR(1) NOT NULL,
  CONSTRAINT ch_tipo CHECK (tipo IN ('M','E'))
);
CREATE TABLE medico(
  dni_medico VARCHAR(9) PRIMARY KEY,
  num_colegiado INT NOT NULL UNIQUE,
  especialidad VARCHAR(150) NOT NULL,
  CONSTRAINT fk_dni_medico FOREIGN KEY (dni_medico) REFERENCES personal(dni)
);
CREATE TABLE planta(
  numero INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);
CREATE TABLE enfermero(
  dni_enfermero VARCHAR(9) PRIMARY KEY,
  turno VARCHAR(60) NOT NULL,
  num_planta INT NOT NULL,
  CONSTRAINT fk_dni_enfermero FOREIGN KEY (dni_enfermero) REFERENCES personal(dni),
  CONSTRAINT fk_num_planta FOREIGN KEY (num_planta) REFERENCES planta(numero)
);
CREATE TABLE paciente(
  num_historia INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_nac DATE NOT NULL
);
CREATE TABLE consulta(
  id_consulta INT PRIMARY KEY,
  num_historia INT NOT NULL,
  dni_med VARCHAR(9) NOT NULL,
  fecha DATE NOT NULL,
  diagnostico VARCHAR(500) NOT NULL,
  CONSTRAINT fk_num_historia FOREIGN KEY (num_historia) REFERENCES paciente(num_historia),
  CONSTRAINT fk_dni_med FOREIGN KEY (dni_med) REFERENCES medico(dni_medico)
);