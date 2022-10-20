/* BANCO DE DADOS */
CREATE DATABASE CanviData;
USE CanviData;

/* Tabelas */
create table empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(100) NOT NULL,
cnpj CHAR(18) NOT NULL,
ramal CHAR(13) NOT NULL,
responsavel VARCHAR(45) NOT NULL,
telResponsavel VARCHAR(14) NOT NULL,
dataAssContrato DATE,
fkMatriz INT,
CONSTRAINT ctfkMatriz FOREIGN KEY (fkMatriz) REFERENCES empresa(idEmpresa)
);

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(256),
senha VARCHAR(45),
fkEmpresa INT,
CONSTRAINT ctfkEmpresaUser FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

create table endereco(
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
nomeCanavial VARCHAR(100),
cep CHAR(8) NOT NULL,
numeroEnd VARCHAR(8) NOT NULL,
fase VARCHAR(45),
fkEmpresa INT NOT NULL,
fkEnderecoEmpresa INT NOT NULL,
CONSTRAINT ctfkEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
CONSTRAINT ctfkEnderecoEmpresa FOREIGN KEY (fkEnderecoEmpresa) REFERENCES endereco(idEndereco)
);

CREATE TABLE hectares (
idHectares INT PRIMARY KEY AUTO_INCREMENT,
classificacaoHectares INT,
fkEndereco INT,
CONSTRAINT ctfkEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);


CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
latitude DECIMAL(8,6) NOT NULL,
longitude DECIMAL(8,6) NOT NULL,
fkHectare INT NOT NULL,
CONSTRAINT ctfkHectare FOREIGN KEY (fkHectare) REFERENCES hectares(idHectares)
);


CREATE TABLE capturaDados (
idCapturaDados INT PRIMARY KEY AUTO_INCREMENT,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2),
dtInspecao DATETIME,
fkSensor INT NOT NULL,
CONSTRAINT ctfkSensor FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);
/*--------------------------------------------------------------------------------------------------------------*/

/* ------------ INSERT'S ------------- */
INSERT INTO empresa values
(null, 'Canvi Data', '495-735-708-079-89', '(11)1010-2020','Eduardo Jorgetti',
'(11)99539-3454', curdate(), null),
(null, 'Cana Brasil', '345-936-327-943-48', '(11)2211-4433','Carlos Eduardo',
'(11)94768-7833', curdate(), null),
(null, 'FMC Corporation', '495-735-708-079-89', '(11)5566-7788','Nathan David',
'(11)94732-2632', curdate(), null),
(null, 'QualiCana', '495-735-708-079-89', '(11)2020-1010','Matheus Joaquim',
'(11)95599-3304', curdate(), null),
(null, 'Cana Doce', '495-735-708-079-89', '(12)3030-4040','Igor Nascimento',
'(11)92890-6729', curdate(), null);

INSERT INTO empresa values
(null, 'Canvi Mata', '466-021-357-789-19', '(11)6661-1666','Salomão Marcelo',
'(11)92345-4579', curdate(), 1),
(null, 'Canvi Mata', '466-021-357-789-19', '(11)6661-1666','Salomão Marcelo',
'(11)92345-4579', curdate(), 1),
(null, 'Canvi Mata', '466-021-357-789-19', '(11)6661-1666','Salomão Marcelo',
'(11)92345-4579', curdate(), 2),
(null, 'Canvi Mata', '466-021-357-789-19', '(11)6661-1666','Salomão Marcelo',
'(11)92345-4579', curdate(), 3),
(null, 'Canvi Mata', '466-021-357-789-19', '(11)6661-1666','Salomão Marcelo',
'(11)92345-4579', curdate(), null);

/* -------------------------------------------------------------------------------- */

INSERT INTO endereco VALUES
(null, 'Machado Remada', '08270-330', '38C', 'Maturação', 1, null),
(null, 'Supra Açucar', '08270-330', '128', 'Brotação', 2, null),
(null, 'Nova Cana', '08270-330', '457', 'Perfilhamento', 3, null),
(null, 'Pura Cana', '08270-330', '46H', 'Brotação', 4, null),
(null, 'Terra Vermelha', '08270-330', '56', 'Perfilhamento', 5, null),
(null, 'Nascente', '08270-330', '79', 'Brotação', 6, null),
(null, 'Aronte', '-', '3456', 'Crescimento de Colmos', 7, null),
(null, 'Torres Primas', '08270-330', '1247', 'Brotação', 8, null),
(null, 'Galho Forte', '08270-330', '7649', 'Perfilhamento', 9, null),
(null, 'Serrão 3', '08270-330', '487B', 'Crescimento de Colmos', 10, null);

/* -------------------------------------------------------------------------------- */

INSERT INTO usuario(email, senha, fkEmpresa) VALUES
('carlos@canvidata.com', '1234567', 1),
('eduardo@canvidata.com', '7654321', 1),
('giovana@canvidata.com', '2546137', 1),
('igor@canvidata.com', '5764312', 1),
('mateus@canvidata.com', '3467512', 1),
('nathan@canvidata.com', '4765123', 1);

INSERT INTO usuario(email, senha, fkEmpresa) VALUES
('thiago@canvimata.com', '1234567', 2),
('leone@canvimata.com', '7654321', 2),
('kaue@canvimata.com', '2546137', 2),
('sophia@canvimata.com', '5764312', 2),
('sara@canvimata.com', '3467512', 2),
('suellen@canvimata.com', '4765123', 2);

/* -------------------------------------------------------------------------------- */

INSERT INTO hectares(classificacaoHectares, fkEndereco) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1),
(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1),
(13, 1), (14, 1), (15, 1), (16, 1), (17, 1), (18, 1),
(19, 1), (20, 1), (21, 1), (22, 1), (23, 1), (24, 1),
(25, 1), (26, 1), (27, 1), (28, 1), (29, 1), (30, 1),
(31, 1), (32, 1), (33, 1), (34, 1), (35, 1), (36, 1),
(37, 1), (38, 1), (39, 1), (40, 1), (41, 1), (42, 1),
(43, 1), (44, 1), (45, 1), (46, 1), (47, 1), (48, 1);

INSERT INTO hectares(classificacaoHectares, fkEndereco) VALUES
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2),
(7, 2), (8, 2), (9, 2), (10, 2), (11, 2), (12, 2),
(13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2),
(19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2),
(25, 2), (26, 2), (27, 2), (28, 2), (29, 2), (30, 2),
(31, 2), (32, 2), (33, 2), (34, 2), (35, 2), (36, 2),
(37, 2), (38, 2), (39, 2), (40, 2), (41, 2), (42, 2),
(43, 2), (44, 2), (45, 2), (46, 2), (47, 2), (48, 2);

INSERT INTO hectares(classificacaoHectares, fkEndereco) VALUES
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3),
(7, 3), (8, 3), (9, 3), (10, 3), (11, 3), (12, 3),
(13, 3), (14, 3), (15, 3), (16, 3), (17, 3), (18, 3),
(19, 3), (20, 3), (21, 3), (22, 3), (23, 3), (24, 3),
(25, 3), (26, 3), (27, 3), (28, 3), (29, 3), (30, 3),
(31, 3), (32, 3), (33, 3), (34, 3), (35, 3), (36, 3),
(37, 3), (38, 3), (39, 3), (40, 3), (41, 3), (42, 3),
(43, 3), (44, 3), (45, 3), (46, 3), (47, 3), (48, 3);

INSERT INTO hectares(classificacaoHectares, fkEndereco) VALUES
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4),
(7, 4), (8, 4), (9, 4), (10, 4), (11, 4), (12, 4),
(13, 4), (14, 4), (15, 4), (16, 4), (17, 4), (18, 4),
(19, 4), (20, 4), (21, 4), (22, 4), (23, 4), (24, 4),
(25, 4), (26, 4), (27, 4), (28, 4), (29, 4), (30, 4),
(31, 4), (32, 4), (33, 4), (34, 4), (35, 4), (36, 4),
(37, 4), (38, 4), (39, 4), (40, 4), (41, 4), (42, 4),
(43, 4), (44, 4), (45, 4), (46, 4), (47, 4), (48, 4);

INSERT INTO hectares(classificacaoHectares, fkEndereco) VALUES
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
select
	matriz.nomeEmpresa empresa,
    matriz.cnpj 'CNPJ',
    matriz.ramal,
    matriz.responsavel 'resposável',
    matriz.telResponsavel 'telefone do responsavel',
    filial.nomeEmpresa 'Empresa Filial'
from empresa matriz join empresa filial
on filial.fkMatriz = matriz.idEmpresa;


select
	nomeEmpresa empresa,
    cnpj 'CNPJ',
    ramal,
    responsavel 'resposável',
    telResponsavel 'telefone do responsavel',
    endereco.cep,
    endereco.logradouro,
    endereco.numeroEnd 'número',
    endereco.cidade,
    endereco.estado
from empresa join enderecoEmpresa endereco
on fkEmpresa = idEmpresa;


select
	empresa.nomeEmpresa empresa,
    empresa.cnpj 'CNPJ',
    empresa.ramal,
    empresa.responsavel 'resposável',
    empresa.telResponsavel 'telefone do responsavel',
    localCana.nomeLocalCana 'Nome da plantação',
    localCana.cep,
    localCana.logradouroCana Logradouro,
    localCana.numeroCana 'Número',
    localCana.cidadeCana Cidade,
    localCana.ufCana 'Estado',
    localCana.fase 'Fase da plantação',
    localCana.hectares 'Quantidade de hectares'
from empresa join localCana
on fkEmpresa = idEmpresa;

