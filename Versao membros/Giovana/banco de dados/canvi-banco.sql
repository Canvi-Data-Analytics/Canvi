create database canvi;
use canvi;
-- criação das entidades
create table empresa (
    id int primary key auto_increment,
    razaoSocial varchar(100) not null,
    cnpj char(18) not null,
    ramal char(13) not null,
    responsavel varchar(45) not null,
    dataAssinatura datetime default current_timestamp not null,
    fkMatriz int,
    foreign key (fkMatriz) references empresa(id)
);
create table usuario (
    id int primary key auto_increment,
    email varchar(256) not null,
    senha varchar(45) not null,
    fkEmpresa int,
    foreign key (fkEmpresa) references empresa(id)
);
create table endereco (
    id int primary key auto_increment,
    nomeCanavial varchar(100) not null,
    cep char(8) not null,
    numero varchar(8) not null,
    tipoEndereco varchar(45) not null,
    constraint checkTipoEndereco check (tipoEndereco ('empresa', 'canavial')),
    fkEmpresa int,
    foreign key (fkEmpresa) references empresa(id),
);
create table hectare (
    id int primary key auto_increment,
    classificacaoHectare int not null,
    fkEndereco int,
    foreign key (fkEndereco) references endereco(id)
);
create table sensor (
    id int primary key auto_increment,
    latitude decimal (8, 6) not null,
    longitude decimal (8, 6) not null,
    fkHectare int,
    foreign key (fkHectare) references hectare(id)
);
create table captura (
    temperatura decimal (5, 2) not null,
    umidade decimal (5, 2) not null,
    dataInspecao datetime default current_timestamp not null
    foreign key (fkSensor) references sensor(id),
    primary key (id, fkSensor)
);
