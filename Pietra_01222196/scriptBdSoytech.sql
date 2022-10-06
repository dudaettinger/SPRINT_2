create database soytech;
use soytech;

create table EndereçoFazenda (
idEndereçoFazenda int primary key auto_increment,
CEP char(8),
numeroFazenda varchar (45),
bairro varchar(45),
complemento varchar (45) default 'Sem complemento');

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
telefonefixo varchar(20),
telefonecelular varchar(20),
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
idDados int primary key auto_increment,
temperatura decimal(3,1),
umidade decimal(3,1),
dataHora datetime,
fkSensor int,
foreign key (fKSensor) references Sensor (idSensor)
);

create table Sugestoes (
idSugestoes int primary key auto_increment,
texto varchar (100)
);

create table RecuperacaoSenha (
idToken int primary key auto_increment,
dataExpiracao date
);

insert into EndereçoFazenda values 
(null, '09901890', '70', 'Coxipó', default),
(null, '08970123', '90', 'Ouro Fino', 'Lote 1'),
(null, '05021897', '478', 'Alvorada', default),
(null, '09987676', '1097', 'Novo Colorado', default);

insert into Fazenda values
(null, 'Caminho do Pilar', '90000.0', '900', '1'),
(null, 'Fazenda da Terezinha', '50000.0', '500', '2'),
(null, 'Bosque da soja', '70000.0', '700', '3'),
(null, 'Encanto da Alegria', '60000.0', '600', '4');

insert into Usuario (nomeUsuario, email, senha, telefoneFixo, telefoneCelular, fkFazenda) values 
('Joaquim Cruz', 'joaquimcruz@gmail.com', '123456', '(11) 4055-2020', '(11)95123-9434', '1'),
('Maria Conceição', 'mariaconceicao@gmail.com', '345216', '(13)3456-7809', '(13) 98766-9080', '2'),
('Maria Eduarda', 'mariaeduarda@gmail.com', '112233', '(11) 6545-9880', '(11)98765-6090', '3'),
('Marcos Fernando', 'mariafernando@gmail.com', '332211', '(12)4055-6490', '(11) 98866-5544', '4');
    
insert into Sensor values
(null, 'DHT11', 20, 30, 13, 15,'quadrante A1'), -- id1
(null, 'DHT11', 20, 30, 13, 15,'quadrante A2'), -- id2
(null, 'DHT11', 20, 30, 13, 15,'quadrante A3'), -- id3
(null, 'DHT11', 20, 30, 13, 15,'quadrante A4'); -- id4

insert into DadosSensor (temperatura, umidade, datahora, fksensor) values
(21, 14, '2022-08-21 20:48:00', 1),
(20, 15, '2022-08-21 20:48:00', 2),
(18, 17, '2022-08-21 20:48:00', 3),
(22, 14, '2022-08-21 20:48:00', 4);


select * from Usuario;
select * from Fazenda;
select * from endereçoFazenda;
select * from Sensor;
select * from DadosSensor;

select * from endereçoFazenda join fazenda
on fKEndereçoFazenda = idEndereçoFazenda;

select * from sensor join dadossensor
on fkSensor = idSensor
where tipo = 'DHT11';

select nomeUsuario, nomeFazenda from usuario join fazenda
on idfazenda = fkfazenda;



