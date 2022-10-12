create database CanviDataAnalytics;
use CanviDataAnalytics;

create table Empresa(
	idEmpresa int primary key,
    razaoSocial varchar(100),
    cnpj varchar(18),
    ramal varchar(13),
    telResponsavel varchar(14),
    responsavel varchar(45),
    dataAssContrato date,
    email varchar(45),
    senha varchar(64),
    fkMatriz int
);

alter table empresa add foreign key (fkMatriz) references Empresa (idEmpresa);

create table localCana(
	idLocalCana int primary key,
    logradouroCana varchar(70),
    numeroCaba varchar(8),
    cidadeCana varchar(60),
    bairroCana varchar(60),
    ufCana char(2),
    fase varchar(45),
    hectares int,
    fkEmpresa int
);

select * from Empresa;

alter table localCana add foreign key (fkEmpresa) references empresa (idEmpresa);


create table sensor(
	idSensor int primary key,
    latitude decimal (8,6),
    longitude decimal(8,6)
);

create table capturaDados (
	idCapturaDados int,
    temperatura decimal(8,6),
    umidade int,
    dtInspecao datetime
);
alter table capturaDados add column fkSensor int;
alter table capturaDados add foreign key (fkSensor) references sensor (idSensor);
alter table sensor add foreign key (fkLocalCana) references localCana (idLocalCana);

create table enderecoEmpresa(
	idEnderecoEmpresa int,
    numeroEnd varchar(8),
    logradouro varchar(70),
    bairro varchar(60),
    cidade varchar(60),
    estado char(2),
    cep char(8)
);

alter table enderecoEmpresa add foreign key (fkEmpresa) references empresa (idEmpresa);

alter table sensor add foreign key (fkLocalCana) references localCana (idLocalCana);

