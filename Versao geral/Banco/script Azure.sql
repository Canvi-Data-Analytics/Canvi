CREATE DATABASE CanviData;
USE CanviData;

create table empresa (
id INT PRIMARY KEY IDENTITY,
razao VARCHAR(100),
cnpj CHAR(18),
responsavel VARCHAR(45),
ramal CHAR(13),
dataAssContrato DATE,
fkMatriz INT,
	FOREIGN KEY (fkMatriz) REFERENCES empresa(id)
);

CREATE TABLE usuario (
id INT PRIMARY KEY IDENTITY,
nome VARCHAR(45),
email VARCHAR(256),
senha VARCHAR(70),
fkEmpresa INT,
	FOREIGN KEY (fkEmpresa) REFERENCES empresa(id)
);

CREATE TABLE endereco(
id INT PRIMARY KEY IDENTITY,
cep CHAR(9),
numero VARCHAR(8),
tipoEndereco VARCHAR(45),
fkEmpresa INT,
	FOREIGN KEY (fkEmpresa) REFERENCES empresa(id),
	CHECK (tipoEndereco in ('Empresa', 'Canavial', 'Ambos'))
);

CREATE TABLE canavial(
id INT PRIMARY KEY IDENTITY,
nome varchar(70),
fkEndereco int,
	FOREIGN KEY (fkEndereco) REFERENCES endereco(id)
);

CREATE TABLE hectare (
id INT PRIMARY KEY IDENTITY,
numeracaoHec int,
fkCanavial INT,
	FOREIGN KEY (fkCanavial) REFERENCES canavial(id)
);

CREATE TABLE sensor (
id INT PRIMARY KEY IDENTITY,
posicao varchar (15),
fkHectare INT,
	FOREIGN KEY (fkHectare) REFERENCES hectare(id)
);

CREATE TABLE capturaDado (
id INT primary key IDENTITY,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2),
dtCaptura DATETIME,
fkSensor INT,
	FOREIGN KEY (fkSensor) REFERENCES sensor(id)
);	

insert into empresa values
	(null,'Destilaria Taboado','14.761.618/0001-89', 'Nathan', curdate(), null, '(11)3414-1414'),
    (null,'Adega Do Cervo','05.916.575/0001-72', 'Eduardo', curdate(), 2, '(11)3414-8989'),
    (null,'Consulcana','11.318.047/0001-14', 'Igor', curdate(), null , '(11)3414-0809');
    
insert into usuario values 
    (null, 'Igor', 'igor@hotmail.com', '12345678', 1),
    (null, 'Eduardo', 'eduardo@hotmail.com', '12345678', 2),	
    (null, 'Matheus', 'matheus@hotmail.com', '12345678', 3);

insert into endereco (cep, numero, tipoEndereco, fkEmpresa) values
	('05143-050', '340', 'Canavial', 1),
	('05365-030', '10', 'Canavial', 2),
	('05135-070', '120', 'Canavial', 3);
    
INSERT INTO canavial(nome, fkEndereco) VALUES
('Fazenda feliz', 1), ('Fazenda feliz', 2), ('Fazenda feliz', 3);

INSERT INTO hectare(numeracaohec, fkCanavial) VALUES
(1, 1), (2, 1), (1, 2), (2, 2), (1, 3), (2, 3);

insert into sensor values
	(null, 'lado A', 1),
    (null, 'lado B', 1),
    (null, 'lado C', 1),
    (null, 'lado D', 1);

insert into capturaDado (temperatura, umidade, fkSensor) values
	(00.00, 70.00, 1),
	(00.00, 60.00, 2),
	(35.32, 80.00, 3),
	(16.32, 80.00, 4);
    
insert into capturaDado (temperatura, umidade, fkSensor) values
	(40.01, 12.00, 1),
	(43.99, 12.00, 2),
	(40.32, 12.00, 3),
	(40.32, 12.00, 4);

select * from capturaDado;
truncate capturaDado;

-- DESENVOLVIMENTO LENTOOOOOOO 
select count(temperatura) 'contarTemp' from capturaDado where temperatura between 34.01 and 40 or temperatura between 15 and 29.99 
union all
select count(umidade) 'contarUmid' from capturaDado where umidade between 70.01 and 80 or umidade between 40 and 59.99;

-- SEM SE DESENVOLVER 
select count(temperatura) 'contarTemp' from capturaDado where temperatura between 40.01 and 50 or temperatura between 0 and 14.99
union all
select count(umidade) 'contarUmid' from capturaDado where umidade between  80.01 and 100 or umidade between 0 and 39.99;

SELECT * from capturaDado where dtCaptura >= NOW() - INTERVAL 1 DAY;

select round(avg(temperatura), 2) as temperatura, dtCaptura, DATE_FORMAT(dtCaptura,'%H:%i:%s') as momento from capturaDado where fkSensor between 1 and 4 group by dtCaptura order by id desc limit 4;   