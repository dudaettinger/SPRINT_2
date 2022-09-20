create database soytech;

use soytech;

create table endereçoUsuario (
idEndereço int primary key auto_increment,
CEP char(8),
logradouro  varchar (45),
bairro varchar(45));

create table Usuario (
idUsuario int primary key auto_increment,
nomeUsuario varchar(80),
email varchar(80),
senha char(12),
telefone varchar(20),
fkEndereço int,
foreign key (fKEndereço) references endereçoUsuario (idEndereço));
select * from Usuario;

create table Fazenda (
IdFazenda int primary key auto_increment,
nomeFazenda varchar(45),
CEP char(8),
numeroEndereco int,
complementoEndereco varchar(45),
tamanhoHec decimal(6,1),
qtdSensores int);
select * from Fazenda;

create table Sensor (
IdSensor int primary key auto_increment,
tipo varchar(50),
minTemperatura decimal(3,1),
maxtemperatura decimal(3,1),
minUmidade decimal(3,1),
maxUmidade decimal(3,1),
localidade varchar(45));
select * from Sensor;

create table DadosSensor (
idDados int primary key auto_increment,
temperatura decimal(3,1),
umidade decimal(3,1),
dataHora datetime);
select * from DadosSensor;

insert into Usuario (nome, email, senha, telefone, CEP, numeroEndereco, complementoEndereco) values 
	('Joaquim Cruz', 'joaquimcruz@gmail.com', '123456', '11951239434', '09090540', '340', 'apto 14'),
    ('Maria Conceição', 'mariaconceicao@gmail.com', '345216', '1334567809', '09020567', '222', '');

insert into Fazenda values
(null, 'Caminho do Pilar', '09090500', '444', '', '100', '4');

insert into Sensor values
(null, 'DHT11', 20, 30, 13, 15,'quadrante A1'), -- id1
(null, 'DHT11', 20, 30, 13, 15,'quadrante A2'), -- id2
(null, 'DHT11', 20, 30, 13, 15,'quadrante A3'), -- id3
(null, 'DHT11', 20, 30, 13, 15,'quadrante A4'); -- id4

insert into DadosSensor values
(null, 21, 14, '2022-08-21 20:48:00'),
(null, 20, 15, '2022-08-21 20:48:00'),
(null, 18, 17, '2022-08-21 20:48:00'),
(null, 22, 14, '2022-08-21 20:48:00');

insert into DadosSensor values
(null, 21, 14, '2022-08-21 20:53:00'),
(null, 24, 13, '2022-08-21 20:53:00'),
(null, 20, 15, '2022-08-21 20:53:00'),
(null, 22, 14, '2022-08-21 20:53:00');







