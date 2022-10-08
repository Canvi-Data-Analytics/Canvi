/* BANCO DE DADOS */
CREATE DATABASE CanviData;
USE CanviData;

/* Tabelas */
create table empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(45) NOT NULL,
razaoSocial VARCHAR(100) DEFAULT ('Não informado'),
cnpj VARCHAR(18) NOT NULL,
ramal VARCHAR(13) NOT NULL,
responsavel VARCHAR(45) NOT NULL,
telResponsavel VARCHAR(14) NOT NULL,
dataAssContrato DATE,
email VARCHAR(45) NOT NULL,
senha VARCHAR(64) NOT NULL,
fkMatriz INT,
CONSTRAINT ctMatriz FOREIGN KEY (fkMatriz) REFERENCES empresa(idEmpresa)
);


create table enderecoEmpresa(
idEnderecoEmpresa INT PRIMARY KEY AUTO_INCREMENT,
cep CHAR(9) NOT NULL,
logradouro VARCHAR(70) NOT NULL,
numeroEnd VARCHAR(8) NOT NULL,
bairro VARCHAR(60) DEFAULT ('Não informado'),
cidade VARCHAR(60) NOT NULL,
estado CHAR(2) NOT NULL,
fkEmpresa INT NOT NULL,
CONSTRAINT ctEmpresaRef FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);


CREATE TABLE localCana (
idLocalCana INT PRIMARY KEY AUTO_INCREMENT,
nomeLocalCana VARCHAR(100) NOT NULL,
cep CHAR(9) NOT NULL,
logradouroCana VARCHAR(70) NOT NULL,
numeroCana VARCHAR(8) NOT NULL,
bairroCana VARCHAR(60) DEFAULT ('Não informado'),
cidadeCana VARCHAR(60) NOT NULL,
ufCana CHAR(2) NOT NULL,
fase VARCHAR(45) NOT NULL,
hectares INT NOT NULL,
fkEmpresa INT NOT NULL,
CONSTRAINT fkEmpresaRef FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
CONSTRAINT chkFase CHECK (fase in ('Brotação', 'Perfilhamento', 'Crescimento de Colmos'))
);


CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
latitude DECIMAL(8,6) NOT NULL,
longitude DECIMAL(8,6) NOT NULL,
fkLocalCana INT NOT NULL,
CONSTRAINT ctLocalCana FOREIGN KEY (fkLocalCana) REFERENCES localCana(idLocalCana)
);


CREATE TABLE capturaDados (
idCapturaDados INT PRIMARY KEY AUTO_INCREMENT,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2),
dtInspecao DATETIME,
fkSensor INT NOT NULL,
CONSTRAINT ctSensor FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);
/*--------------------------------------------------------------------------------------------------------------*/

/* INSERT'S */
INSERT INTO empresa values
(null, 'Canvi Data', null, '495-735-708-079-89', '(11)5555-5000','Mateus Joaquim',
'(11)95368-6643', curdate(), 'mateus@gmail.com', 'C@mbioform4', null);

INSERT INTO empresa values
(null, 'Canvi Mata', null, '466-021-357-789-19', '(11)7777-7000','Kauan Batista',
'(11)92345-4579', curdate(), 'kauan@gmail.com', 'deixouSaudades', 1);


INSERT INTO enderecoEmpresa VALUES
(null, '08270-330', 'Machado Remada', '38C', null, 'São Paulo', 'SP', 1),
(null, '09564-457', 'Caindo Muito Rapido', '465A', null, 'São Paulo', 'SP', 2);


insert into localCana values
(null, 'Erva Daninha', '06489-249', 'Carro chefe da montuão', '36', null, 'Tamandaré', 'PE', 'Perfilhamento', 5, 1),
(null, 'Selva Dourada', '15798-187', 'Colina do Leão', '654', null, 'Fortaleza', 'CE', 'Brotação', 2, 1);
/*--------------------------------------------------------------------------------------------------------------*/

/* Select's */
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
/*--------------------------------------------------------------------------------------------------------------*/