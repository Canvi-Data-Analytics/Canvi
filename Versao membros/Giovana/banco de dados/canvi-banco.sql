create database canvi;
use canvi;

create table empresa (
	idEmpresa int primary key auto_increment,
	razaoSocial varchar(100) not null,
    cnpj char(18) not null,
    ramal char(13) not null,
	responsavel varchar(45) not null,
    dataAssinatura  datetime default current_timestamp not null
);

create table endereco (
	idEndereco int primary key auto_increment,
    nomeCanavial varchar(100) not null, 
    cep char(8) not null,
    numero varchar(8) not null,
    tipoEndereco varchar(45) not null
);

create table captura (
	idCaptura int primary key auto_increment,
    temperatura decimal (5, 2) not null,
    umidade decimal (5, 2) not null,
    dataInspecao datetime default current_timestamp not null
);

create table sensor (
	idSensor int primary key auto_increment, 
    latitude decimal (8, 6) not null,
    longitude decimal (8, 6) not null
);

create table hectare (
	idHectare int primary key auto_increment,
    classificacaoHectare int not null
);

create table usuario (
	idUsuario int primary key auto_increment,
    email varchar(256) not null,
    senha varchar(45) not null
);

