CREATE TABLE equipo(
codigo_equipo INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL UNIQUE,
ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE jugador(
  codigo_jug INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  dorsal INT NOT NULL,
  posicion VARCHAR(100) NOT NULL,
  codigo_eq INT NOT NULL,
  CONSTRAINT fk_cod_eq FOREIGN KEY (codigo_eq) REFERENCES equipo(codigo_equipo)
);

CREATE TABLE partido (
  codigo INT PRIMARY KEY,
  fecha DATE NOT NULL,
  goles_local INT NOT NULL,
  goles_visitante INT NOT NULL,
  codigo_eq_local INT NOT NULL,
  codigo_eq_visitante INT NOT NULL,
  CONSTRAINT fk_cod_local FOREIGN KEY (codigo_eq_local) REFERENCES equipo(codigo_equipo),
  CONSTRAINT fk_cod_visitante FOREIGN KEY (codigo_eq_visitante) REFERENCES equipo(codigo_equipo)
);