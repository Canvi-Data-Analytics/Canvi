/* BANCO DE DADOS */
CREATE DATABASE CanviData;
USE CanviData;

/* Tabelas com select's simples*/
create table empresa (
id INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(100) NOT NULL,
cnpj CHAR(18) NOT NULL,
ramal CHAR(13) NOT NULL,
responsavel VARCHAR(45) NOT NULL,
dataAssContrato DATE,
fkMatriz INT,
CONSTRAINT ctfkMatriz FOREIGN KEY (fkMatriz) REFERENCES empresa(id)
);
select
	e.razaoSocial 'Razão Social',
    e.cnpj,
    e.ramal,
    e.responsavel,
    e.dataAssContrato 'Data de Assinatura do Contrato'
from empresa e;
    
    

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR(45) NOT NULL,
email VARCHAR(256) NOT NULL,
senha VARCHAR(45) NOT NULL,
fkEmpresa INT,
CONSTRAINT ctfkEmpresaUser FOREIGN KEY (fkEmpresa) REFERENCES empresa(id)
);
select
	u.nomeUsuario 'Nome do Usuario',
    u.email,
    u.senha
from usuario u;



create table endereco(
id INT PRIMARY KEY AUTO_INCREMENT,
nomeCanavial VARCHAR(100),
cep CHAR(8) NOT NULL,
numero VARCHAR(8) NOT NULL,
tipoEndereco VARCHAR(45) NOT NULL,
fkEmpresa INT NOT NULL,
CONSTRAINT ctfkEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(id),
CONSTRAINT chktipoEndereco CHECK (tipoEndereco ('Empresa', 'Canavial', 'Ambos'))
);
select
	endereco.nomeCanavial 'Nome do Canavial',
	endereco.cep,
	endereco.numero,
	endereco.tipoEndereco
from endereco;



CREATE TABLE hectares (
id INT PRIMARY KEY AUTO_INCREMENT,
classificacaoHectare INT NOT NULL,
fkEndereco INT,
CONSTRAINT ctfkEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(id)
);
select
	hectares.classificacaoHectare,
    hectares.fkEndereco 'Canavial referente'
from hectares;


CREATE TABLE sensor (
id INT PRIMARY KEY AUTO_INCREMENT,
latitude DECIMAL(8,6) NOT NULL,
longitude DECIMAL(8,6) NOT NULL,
fkHectare INT NOT NULL,
CONSTRAINT ctfkHectare FOREIGN KEY (fkHectare) REFERENCES hectares(id)
);
select
	sensor.latitude,
	sensor.longitude,
	sensor.fkHectare 'Hectare referente'
from sensor;



CREATE TABLE capturaDado (
id INT AUTO_INCREMENT,
temperatura DECIMAL(5,2) NOT NULL,
umidade DECIMAL(5,2) NOT NULL,
dtInspecao DATETIME NOT NULL,
fkSensor INT NOT NULL,
CONSTRAINT ctfkSensor FOREIGN KEY (fkSensor) REFERENCES sensor(id),
PRIMARY KEY (id, fkSensor)
);
select
	dados.temperatura,
	dados.umidade,
	dados.dtInspecao,
	dados.fkSensor 'Sensor de referente'
from capturaDado dados;



/*--------------------------------------------------------------------------------------------------------------*/

/* ------------ INSERT'S ------------- */
INSERT INTO empresa values
(null, 'Canvi Data', '495-735-708-079-89', '(11)5555-5000','Mateus Joaquim', curdate(), null),
(null, 'Canavial Brasil', '345-936-327-943-48', '(11)3333-1000','Jonatas Kirin', curdate(), null),
(null, 'FMC Corporation', '495-735-708-079-89', '(11)4444-7000','Kaique Fernandes', curdate(), null),
(null, 'QualiCana', '495-735-708-079-89', '(11)2222-9000','Miguel Inkson', curdate(), null),
(null, 'Doce Cana', '495-735-708-079-89', '(11)1111-5000','Marcos Joaquim', curdate(), null);

INSERT INTO empresa values
(null, 'Canvi Mata', '466-021-357-789-19', '(11)7777-7000','Rodrygo Batista', curdate(), 1),
(null, 'Canvi Mata', '466-021-357-789-19', '(11)7777-7000','Rodrygo Batista', curdate(), 1),
(null, 'Canvi Mata', '466-021-357-789-19', '(11)7777-7000','Rodrygo Batista', curdate(), 2),
(null, 'Canvi Mata', '466-021-357-789-19', '(11)7777-7000','Rodrygo Batista', curdate(), 3),
(null, 'Canvi Mata', '466-021-357-789-19', '(11)7777-7000','Rodrygo Batista', curdate(), null);

/* -------------------------------------------------------------------------------- */

INSERT INTO endereco VALUES
(null, 'Machado Remada', '08270330', '38C', 'Canvial', 1),
(null, 'Supra Açucar', '08270330', '128', 'Canvial', 2),
(null, 'Nova Cana', '08270330', '457', 'Canvial', 3),
(null, 'Pura Cana', '08270330', '46H', 'Canvial', 4),
(null, 'Terra Vermelha', '08270330', '56', 'Canvial', 5),
(null, 'Nascente', '08270330', '79', 'Empresa', 6),
(null, 'Aronte', '08270330', '3456', 'Canvial', 7),
(null, 'Torres Primas', '08270330', '1247', 'Empresa', 8),
(null, 'Galho Forte', '08270330', '7649', 'Canvial', 9),
(null, 'Serrão 3', '08270330', '487B', 'Ambos', 10);

/* -------------------------------------------------------------------------------- */

INSERT INTO usuario(nomeUsuario, email, senha, fkEmpresa) VALUES
('Carlos', 'carlos@canvidata.com', '1234567', 1),
('Eduardo', 'eduardo@canvidata.com', '7654321', 1),
('Giovana', 'giovana@canvidata.com', '2546137', 1),
('Igor', 'igor@canvidata.com', '5764312', 1),
('Mateus', 'mateus@canvidata.com', '3467512', 1),
('Nathan', 'nathan@canvidata.com', '4765123', 1);

INSERT INTO usuario(nomeUsuario, email, senha, fkEmpresa) VALUES
('Thiago', 'thiago@canvimata.com', '1234567', 2),
('Leone', 'leone@canvimata.com', '7654321', 2),
('Kaue', 'kaue@canvimata.com', '2546137', 2),
('Sophia', 'sophia@canvimata.com', '5764312', 2),
('Sara', 'sara@canvimata.com', '3467512', 2),
('Suellen', 'suellen@canvimata.com', '4765123', 2);

/* -------------------------------------------------------------------------------- */

INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1),
(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1),
(13, 1), (14, 1), (15, 1), (16, 1), (17, 1), (18, 1),
(19, 1), (20, 1), (21, 1), (22, 1), (23, 1), (24, 1),
(25, 1), (26, 1), (27, 1), (28, 1), (29, 1), (30, 1),
(31, 1), (32, 1), (33, 1), (34, 1), (35, 1), (36, 1),
(37, 1), (38, 1), (39, 1), (40, 1), (41, 1), (42, 1),
(43, 1), (44, 1), (45, 1), (46, 1), (47, 1), (48, 1);

INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2),
(7, 2), (8, 2), (9, 2), (10, 2), (11, 2), (12, 2),
(13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2),
(19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2),
(25, 2), (26, 2), (27, 2), (28, 2), (29, 2), (30, 2),
(31, 2), (32, 2), (33, 2), (34, 2), (35, 2), (36, 2),
(37, 2), (38, 2), (39, 2), (40, 2), (41, 2), (42, 2),
(43, 2), (44, 2), (45, 2), (46, 2), (47, 2), (48, 2);

INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3),
(7, 3), (8, 3), (9, 3), (10, 3), (11, 3), (12, 3),
(13, 3), (14, 3), (15, 3), (16, 3), (17, 3), (18, 3),
(19, 3), (20, 3), (21, 3), (22, 3), (23, 3), (24, 3),
(25, 3), (26, 3), (27, 3), (28, 3), (29, 3), (30, 3),
(31, 3), (32, 3), (33, 3), (34, 3), (35, 3), (36, 3),
(37, 3), (38, 3), (39, 3), (40, 3), (41, 3), (42, 3),
(43, 3), (44, 3), (45, 3), (46, 3), (47, 3), (48, 3);

INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4),
(7, 4), (8, 4), (9, 4), (10, 4), (11, 4), (12, 4),
(13, 4), (14, 4), (15, 4), (16, 4), (17, 4), (18, 4),
(19, 4), (20, 4), (21, 4), (22, 4), (23, 4), (24, 4),
(25, 4), (26, 4), (27, 4), (28, 4), (29, 4), (30, 4),
(31, 4), (32, 4), (33, 4), (34, 4), (35, 4), (36, 4),
(37, 4), (38, 4), (39, 4), (40, 4), (41, 4), (42, 4),
(43, 4), (44, 4), (45, 4), (46, 4), (47, 4), (48, 4);

INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 5), (2, 5), (3, 5), (4, 5), (5, 5), (6, 5),
(7, 5), (8, 5), (9, 5), (10, 5), (11, 5), (12, 5),
(13, 5), (14, 5), (15, 5), (16, 5), (17, 5), (18, 5),
(19, 5), (20, 5), (21, 5), (22, 5), (23, 5), (24, 5),
(25, 5), (26, 5), (27, 5), (28, 5), (29, 5), (30, 5),
(31, 5), (32, 5), (33, 5), (34, 5), (35, 5), (36, 5),
(37, 5), (38, 5), (39, 5), (40, 5), (41, 5), (42, 5),
(43, 5), (44, 5), (45, 5), (46, 5), (47, 5), (48, 5);

/*--------------------------------------------------------------------------------------------------------------*/
/* ---------- Select's ---------- */

/* Empresa Matriz e Empresa Filial */
select
	matriz.razaoSocial 'Empresa Matriz',
	matriz.cnpj,
    matriz.ramal,
    matriz.responsavel,
    matriz.dataAssContrato 'Data de Assinatura do Contrato',
    filial.razaoSocial 'Empresa Filial',
	filial.cnpj,
    filial.ramal,
    filial.responsavel,
    filial.dataAssContrato 'Data de Assinatura do Contrato'
from empresa filial JOIN empresa matriz
ON  filial.fkMatriz = matriz.id;


/* Usuarios das determinadas empresas */
select
	e.razaoSocial 'Razão Social',
    e.cnpj,
    e.ramal,
    e.responsavel,
    e.dataAssContrato 'Data de Assinatura do Contrato',
    u.nomeUsuario 'Nome do Usuario',
    u.email,
    u.senha
from empresa e JOIN usuario u
ON e.id  = u.fkEmpresa;


/* Endereço das Empresas e Canaviais (e qual empresa o Canavial referencia) */
select
	e.razaoSocial 'Razão Social',
    e.cnpj,
    e.ramal,
    e.responsavel,
    e.dataAssContrato 'Data de Assinatura do Contrato',
    endereco.nomeCanavial 'Nome do Canavial',
	endereco.cep,
	endereco.numero,
	endereco.tipoEndereco
from empresa e JOIN endereco
ON e.id  = endereco.fkEmpresa;


/* Dados e seus referentes sensores, e sensores e seus referentes hectares */
select
	hectares.classificacaoHectare,
    hectares.fkEndereco 'Canavial referente',
    sensor.latitude,
	sensor.longitude,
	sensor.fkHectare 'Hectare referente',
    dados.temperatura,
	dados.umidade,
	dados.dtInspecao,
	dados.fkSensor 'Sensor de referente'
from hectares JOIN sensor
ON hectares.id = sensor.fkHectare
JOIN capturaDado dados
ON dados.fkSensor = hectares.id;

/*--------------------------------------------------------------------------------------------------------------*/