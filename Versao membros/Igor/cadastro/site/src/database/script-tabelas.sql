CREATE DATABASE CanviData2;
USE CanviData2;

create table empresa (
id INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(100) NOT NULL,
cnpj CHAR(18) NOT NULL,
ramal CHAR(13) NOT NULL,
dataAssContrato DATE,
fkMatriz INT,
CONSTRAINT ctfkMatriz FOREIGN KEY (fkMatriz) REFERENCES empresa(id)
);

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario varchar(45),
email VARCHAR(256),
senha VARCHAR(45),
fkEmpresa INT,
CONSTRAINT ctfkEmpresaUser FOREIGN KEY (fkEmpresa) REFERENCES empresa(id)
);

create table endereco(
id INT PRIMARY KEY AUTO_INCREMENT,
cep CHAR(9) NOT NULL,
numero VARCHAR(8) NOT NULL,
tipoEndereco varchar(45),
CONSTRAINT ctTipoEndereco check (tipoEndereco in ('Canavial', 'Empresa', 'Ambos')),
nomeCanavial VARCHAR(100)
);

CREATE TABLE hectare (
id INT PRIMARY KEY AUTO_INCREMENT,
classificacaoHectares INT,
fkEndereco INT,
CONSTRAINT ctfkEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(id)
);


CREATE TABLE sensor (
id INT PRIMARY KEY AUTO_INCREMENT,
latitude DECIMAL(8,6) NOT NULL,
longitude DECIMAL(8,6) NOT NULL,
fkHectare INT NOT NULL,
CONSTRAINT ctfkHectare FOREIGN KEY (fkHectare) REFERENCES hectare(id)
);


CREATE TABLE capturaDado (
id INT AUTO_INCREMENT,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2),
dtInspecao DATETIME,
fkSensor INT NOT NULL,
CONSTRAINT ctfkSensor FOREIGN KEY (fkSensor) REFERENCES sensor(id),
primary key (id, fkSensor)
);