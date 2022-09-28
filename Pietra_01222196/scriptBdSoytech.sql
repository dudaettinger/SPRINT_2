create database soytech;
use soytech;

create table endereçoFazenda (
idEndereçoFazenda int primary key auto_increment,
CEP char(8),
numeroFazenda varchar (45),
bairro varchar(45));

create table Fazenda (
idFazenda int primary key auto_increment,
nomeFazenda varchar(45),
tamanhoHec decimal(6,1),
qtdSensores int,
fkEndereçoFazenda int,
foreign key (fKEndereçoFazenda) references endereçoFazenda (idEndereçoFazenda));

create table Usuario (
idUsuario int primary key auto_increment,
nomeUsuario varchar(80),
email varchar(80),
senha char(12),
telefone varchar(20),
tipoTelefone varchar(45) constraint chktipoTelefone check
		(tipoTelefone in ('fixo', 'celular')),
fkFazenda int,
foreign key (fKFazenda) references Fazenda (idFazenda));

create table Sensor (
idSensor int primary key auto_increment,
tipo varchar(50),
minTemperatura decimal(3,1),
maxtemperatura decimal(3,1),
minUmidade decimal(3,1),
maxUmidade decimal(3,1),
localidade varchar(45));

create table DadosSensor (
idDados int auto_increment,
temperatura decimal(3,1),
umidade decimal(3,1),
dataHora datetime,
fkSensor int,
foreign key (fKSensor) references Sensor (idSensor),
primary key (fkSensor, idDados) 
);

insert into endereçoFazenda values 
(null, '09901890', '70', 'Coxipó'),
(null, '08970123', '90', 'Ouro Fino'),
(null, '05021897', '478', 'Alvorada'),
(null, '09987676', '1097', 'Novo Colorado');

insert into Fazenda values
(null, 'Caminho do Pilar', '90000.0', '900', '1'),
(null, 'Fazenda da Terezinha', '50000.0', '500', '2'),
(null, 'Bosque da soja', '70000.0', '700', '3'),
(null, 'Encanto da Alegria', '60000.0', '600', '4');

insert into Usuario (nomeUsuario, email, senha, telefone, tipoTelefone, fkFazenda) values 
('Joaquim Cruz', 'joaquimcruz@gmail.com', '123456', '(11)95123-9434', 'celular', '1'),
('Maria Conceição', 'mariaconceicao@gmail.com', '345216', '(13)3456-7809', 'fixo', '2'),
('Maria Eduarda', 'mariaeduarda@gmail.com', '112233', '(11)98765-6090', 'celular', '3'),
('Marcos Fernando', 'mariafernando@gmail.com', '332211', '(12)4055-6490', 'fixo', '4');
    
insert into Sensor values
(null, 'DHT11', 20, 30, 13, 15,'quadrante A1'), -- id1
(null, 'DHT11', 20, 30, 13, 15,'quadrante A2'), -- id2
(null, 'DHT11', 20, 30, 13, 15,'quadrante A3'), -- id3
(null, 'DHT11', 20, 30, 13, 15,'quadrante A4'); -- id4

insert into DadosSensor values
(1, 21, 14, '2022-08-21 20:48:00',null),
(2, 20, 15, '2022-08-21 20:48:00',null),
(3, 18, 17, '2022-08-21 20:48:00',null),
(4, 22, 14, '2022-08-21 20:48:00',null);

insert into DadosSensor values
(1, 21, 14, '2022-08-21 20:53:00', null),
(2, 24, 13, '2022-08-21 20:53:00', null),
(3, 20, 15, '2022-08-21 20:53:00', null),
(4, 22, 14, '2022-08-21 20:53:00', null);

select * from Usuario;
select * from Fazenda;
select * from endereçoFazenda;
select * from Sensor;
select * from DadosSensor;





