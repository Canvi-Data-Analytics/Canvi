create database sprint2;
use sprint2;

create table empresa (
idEmpresa int primary key auto_increment,
razaoSocial varchar(100),
cnpj char(18),
ramal char(13),
responsavel varchar(45),
telResponsavel char(14),
dataAssContrato date,
email varchar(256),
senha varchar(64),
fkMatriz int,
constraint ctFkMatriz foreign key (fkMatriz) references empresa (idEmpresa)
);

create table enderecoEmpresa (
idEnderecoEmpresa int primary key auto_increment,
cep char(9),
logradouro varchar(70),
numeroEnd varchar(8),
bairro varchar(60),
cidade varchar(60),
estado char(2),
fkEmpresa int,
constraint ctFkEndereco foreign key (fkEmpresa) references empresa (idEmpresa)
);

create table localCana (
idLocalCana int primary key auto_increment,
cep char(9),
logradouroCana varchar(70),
numeroCana varchar(8),
bairroCana varchar(60),
cidadeCana varchar(60),
ufCana char(2),
fase varchar(45),
hectares int,
fkEmpresa int,
constraint ctFkEmpresa foreign key (fkEmpresa) references empresa (idEmpresa)
);

create table sensor (
idSensor int primary key auto_increment,
latitude varchar(10),
longitude varchar(10),
fkLocalCana int,
constraint ctFkLocalCana foreign key (fkLocalCana) references localCana (idLocalCana)
);

create table capturaDados (
idCapturaDados int,
temperatura decimal(5,2),
umidade decimal (5,2),
dtInspecao datetime,
fkSensor int,
constraint ctFkSensor foreign key (fkSensor) references sensor (idSensor),
primary key (idCapturaDados, fkSensor)
);

insert into empresa values
	(null, 'CANA DA HARMONIA - PRODUCAO DE CANA-DE-ACUCAR LTDA', '37.826.246/0001-27', '11 3090-4090', '11 93090-4090', 'Marco Aurelio', '2022-10-05', 'amocana@harmonia.com', 'cana123', null),
    (null, 'ANCORA AGROPECUARIA PRODUTORA DE CANA-DE-ACUCAR LTDA.', '23.817.150/0001-98', '11 3091-4091', '11 93091-4091', 'Kleber Machado', '2022-11-06', 'canaacucar@ancora.com', 'cana123', null);
    
insert into enderecoEmpresa values 
	(null, '05133-020', 'Avenida Pedroso de Morais', '320', 'Pinheiros', 'São Paulo', 'SP', 1),
    (null, '05133-021', 'Avenida Nove de Julho', '110', 'Jardim Paulista', 'São Paulo', 'SP', 2);

insert into localCana values
	(null, '05161-021', 'Rodovia Doutor Paulo Lauro', '110', 'Monjolinho', 'São Carlos', 'SP', 'Brotação', 100, 1),
	(null, '14815-000', 'Rodovia Washington Luiz', '50', 'Monjolinho', 'São Carlos', 'SP', 'Brotação', 20, 1),
    (null, '05162-302', 'Rodovia Laurentino Mascari', '160', 'Guariroba', 'Taquaritinga', 'SP', 'Maturação', 50, 2);

insert into sensor values 
	(null, '-24.090123', '-43.012390', 1),
    (null, '-21.123098', '-42.120932', 2);

insert into capturaDados values
	(1, '30.41', '70.00', '2022-07-14 09:00:00', 1),
    (2, '30.41', '70.50', '2022-07-14 09:05:00', 1),
    (1, '27.41', '65.30', '2022-07-15 09:00:00', 2),
    (2, '28.41', '67.30', '2022-07-15 09:05:00', 2);

-- Ver a temperatura 
select empresa.razaoSocial, localCana.cep ,sensor.* , temperatura from sensor join capturaDados on fkSensor = idSensor join localCana on fkLocalCana = idLocalCana join empresa on fkEmpresa = idEmpresa;

select empresa.razaoSocial, localCana.cep ,sensor.* , temperatura from sensor join capturaDados on fkSensor = idSensor join localCana on fkLocalCana = idLocalCana join empresa on fkEmpresa = idEmpresa;


