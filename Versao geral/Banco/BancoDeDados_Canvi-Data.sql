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

insert into empresa values
	(null,'Destilaria Taboado','14.761.618/0001-89','(11)3414-1414', 'Nathan', curdate(), null),
    (null,'Adega Do Cervo','05.916.575/0001-72','(11)3414-8989', 'Eduardo', curdate(), null),
    (null,'Consulcana','111.318.047/0001-14','(11)3414-0809', 'Igor', curdate(), null);

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

insert into usuario values 
    (null, 'Igor', 'igor@hotmail.com', '12345678', 2),
    (null, 'Eduardo', 'eduardo@hotmail.com', '12345678', 3),	
    (null, 'Matheus', 'matheus@hotmail.com', '12345678', 4);

select
	u.nomeUsuario 'Nome do Usuario',
    u.email,
    u.senha
from usuario u;

create table endereco(
id INT PRIMARY KEY AUTO_INCREMENT,
nomeCanavial VARCHAR(100),
cep CHAR(9) NOT NULL,
numero VARCHAR(8) NOT NULL,
tipoEndereco VARCHAR(45) NOT NULL,
fkEmpresa INT NOT NULL,
CONSTRAINT ctfkEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(id),
CONSTRAINT chktipoEndereco CHECK (tipoEndereco in ('Empresa', 'Canavial', 'Ambos'))
);

insert into endereco (nomeCanavial, cep, numero, tipoEndereco, fkEmpresa) values
	('Fazenda Luz', '05163-020', '340', 'Canavial', 1),
	('Fazenda Osíris', '05365-030', '10', 'Canavial', 2),
	('Fazenda Corsair', '05165-060', '120', 'Canavial', 3),
	('Fazenda Brandão', '05133-020', '140', 'Canavial', 4);

select
	endereco.nomeCanavial 'Nome do Canavial',
	endereco.cep,
	endereco.numero,
	endereco.tipoEndereco
from endereco;

select empresa.*, endereco.*, usuario.* from empresa join endereco on empresa.id = endereco.fkEmpresa join usuario on empresa.id = usuario.fkEmpresa;

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

insert into sensor values
	(null, -21.090909, -43.000006, 1),
    (null, -22.083232, -42.152637, 2),
    (null, -21.234221, -42.152248, 3),
    (null, -21.876367, -42.987388, 4);


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

/* -------------------------------------------------------------------------------- */






INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1);


INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2);

INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3);

INSERT INTO hectares(classificacaoHectare, fkEndereco) VALUES
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4);



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