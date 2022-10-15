CREATE DATABASE CanviDataAnalytics;
USE CanviDataAnalytics;

CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
razaoSocial VARCHAR(100) NOT NULL,
cnpj CHAR(18) NOT NULL,
ramal CHAR(13) NOT NULL,
telResponsavel CHAR(14) NULL,
fkMatriz int,
	CONSTRAINT constMatriz foreign key (fkMatriz)
    REFERENCES empresa(idEmpresa),
responsavel VARCHAR(45) NOT NULL,
dataAssContrato DATE NOT NULL,
email VARCHAR(256) NOT NULL,
senha VARCHAR(64) NOT NULL
);

CREATE TABLE enderecoEmpresa(
idEnderecoEmpresa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
numeroEnd VARCHAR(8) NOT NULL,
logradouro VARCHAR(70) NOT NULL,
bairro VARCHAR(60) NOT NULL,
cidade VARCHAR(60) NOT NULL,
uf CHAR(2) NOT NULL,
cep CHAR(9) NOT NULL,
fkEmpresa INT NOT NULL,
  CONSTRAINT constFkEmppresa FOREIGN KEY (fkEmpresa) 
  REFERENCES Empresa (idEmpresa)
);

CREATE TABLE localCana (
idLocalCana INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
logradouroCana VARCHAR(70) NOT NULL,
numeroCana VARCHAR(8) NOT NULL,
bairroCana VARCHAR(60) NOT NULL,
cidadeCana VARCHAR(60) NOT NULL,
ufCana CHAR(2) NOT NULL,
cepCana CHAR(9) NOT NULL,
qtdePilares TINYINT NOT NULL,
qtdeDrones TINYINT NULL,
fase VARCHAR(45) NOT NULL,
	CONSTRAINT constCheckFase 
    CHECK (fase IN ('Brotação', 'Perfilhamento', 'Crescimento de colmos', 'Maturação', 'Florescimento')),
fkEmpresa INT NOT NULL,
	CONSTRAINT constFkEmpresa FOREIGN KEY (fkEmpresa) 
    REFERENCES Empresa(idEmpresa)
);

CREATE TABLE sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  latitude DECIMAL(8,6),
  longitude DECIMAL(8,6),
  fkCana INT NOT NULL,
	CONSTRAINT constFkCana FOREIGN KEY (fkCana) 
    REFERENCES localCana (idLocalCana)
);

CREATE TABLE capturaDados(
idCapturaDados INT NOT NULL,
temperatura DECIMAL(5,2) NOT NULL,
umidade DECIMAL(5,2) NOT NULL,
dtInspecao DATETIME NOT NULL DEFAULT now(),
fkSensor INT NOT NULL,
	CONSTRAINT constFkSensor FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor),
PRIMARY KEY (fkSensor, idCapturaDados)
);

-- DML
insert into Empresa (razaoSocial,cnpj,ramal,telResponsavel,fkMatriz,responsavel,dataAssContrato,email,senha) values
('Canvi Data Analytics','01.123.456/0001-01','2003-3002','011 98975-9759',null,'Carlos','2022-10-01','carlos@gmail.com','carlos123');

insert into enderecoEmpresa (numeroEnd,logradouro,bairro,cidade,uf,cep,fkEmpresa) values
('4B','Rua Hadock Lobo','Cerqueira Cesar','São Paulo','SP','01414-905',1);

insert into localCana (numeroCana,logradouroCana,bairroCana,cidadeCana,ufCana,cepCana,qtdePilares,qtdeDrones,fase,fkEmpresa) values
('600','José Paulo','Campo B4','São Paulo','SP','09548-989',50,10,'Brotação',1);

insert into sensor (longitude,latitude,fkCana) values
(850.56,644.97,1);

insert into capturaDados (idCapturaDados,temperatura,umidade,dtInspeca,fkSensor) values
(1,25.53,50.95,now(),1);

-- DQL
select * from Empresa;
select * from enderecoEmpresa;
select * from localCana;
select * from capturaDados;

select * from empresa 
		join enderecoEmpresa
        on idEmpresa = fkEmpresa;
        
select * from empresa
		join enderecoEmpresa as ee
        on idEmpresa = ee.fkEmpresa
        join localCana as lc
        on idEmpresa = lc.fkEmpresa;
        
select * from sensor
		join capturaDados
        on idSensor = fkSensor;
        
select * from empresa
		join enderecoEmpresa as ee
        on idEmpresa = ee.fkEmpresa
        join localCana as lc
        on idEmpresa = lc.fkEmpresa
        join sensor 
        on lc.idLocalCana = fkCana
        join capturaDados
        on idSensor = fkSensor;