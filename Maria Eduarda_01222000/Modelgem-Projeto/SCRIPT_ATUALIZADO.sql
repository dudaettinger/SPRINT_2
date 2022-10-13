create database soytech;
use soytech;

-- tables
create table endereco(
idEndereco int primary key auto_increment,
CEP char(8),
logradouro varchar(45),
numero varchar (6),
complemento varchar (45) default 'Sem complemento',
cidade varchar(45),
estado varchar(45),
UF char(2)
);


create table fazenda (
idFazenda int primary key auto_increment,
nome varchar(45),
nomeFantasia varchar(80),
CNPJ varchar(14),
fkEndereco int,
foreign key (fKEndereco)
references endereco(idEndereco)
);

create table hectare(
idHectare int auto_increment,
tamanhoHec decimal(6,1),
qtdSensorHec varchar(45),
fkFazenda int,
foreign key(fkFazenda) 
references fazenda(idFazenda),
primary key (idHectare, fkFazenda)
); 

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(100),
email varchar(80),
senha varchar(25),
telefonefixo varchar(20),
telefoneCelular varchar(20),
fkFazenda int,
foreign key (fKFazenda)
 references Fazenda (idFazenda)
);

create table sensor (
idSensor int auto_increment,
tipo varchar(50),
setor char(10),
fkHectar int,
foreign key(fkHectar)
references sensor(idSensor),
primary key (idSensor,fkHectare),
fkDadosKpi int,
foreign key(fkDadosKpi) 
references dadosKpi(idKpi)
);

create table dadoSensor (
idDados int primary key auto_increment,
temperatura decimal(3,1),
umidade decimal(3,1),
dataHora datetime,
fkSensor int,
foreign key (fKSensor)
 references Sensor(idSensor)
); 

create table sugestao (
idSugestao int auto_increment,
assunto varchar(45),
texto varchar (250),
fkUsuario int,
foreign key(fkUsuario)
references sugestao(idSugestao),
primary key (idSugestao, fkUsuario)
) auto_increment = 100;

create table dadosKpi(
idKpi int primary key auto_increment,
minTemp varchar(45),
maxTemp varchar(45),
minUmi varchar(45),
maxUmi varchar(45)
);

create table recuperacaoSenha (
idToken int auto_increment,
Token varchar(32),
dataExpiracao datetime,
fkUsuario int,
foreign key(fkUsuario) 
references recuperacaoSenha(idToken),
primary key (idToken, fkUsuario)
);

-- inserts
insert into endereco values 
(null, '09901890', 'Rua Coxipó', '70', 'Lote 1','Salvador', 'Bahia', 'BA'),
(null, '08970123', 'Rua Alameira Francisco', '60', 'Lote 2', 'São Paulo','São Paulo','SP'),
(null, '05021897', 'Rua João Navarro Botelho', '478', default,'Florianópolis', 'Santa Catarina', 'SC'),
(null, '09987676', 'Rua Jaguare', '97', default, 'Campo Grande', 'Mato Grosso do Sul', 'MS');

-- VITOR SEU PAU NO CU ARRUMA DAQUI PRA BAIXO VIU CARALHO QUERO O NEGOCIO PRONTO PRA JÁ

insert into fazenda values
(null, 'Caminho do Pilar', 'Havaina Branca', '90000.0', '1' ),
(null, 'Fazenda da Terezinha', 'Kyan', '50000.0', '2'),
(null, 'Bosque da soja', 'Bate cabeça', '70000.0', '3'),
(null, 'Encanto da Alegria', 'Laila', '60000.0', '4');

insert into hectare values
(null, '2', '4'),
(null, '5', '10'),
(null, '1', '2'),
(null, '10', '20');

insert into usuario (nomeUsuario, email, senha, telefoneFixo, telefoneCelular, fkFazenda) values 
('Joaquim Cruz', 'joaquimcruz@gmail.com', '123456', '(11) 4055-2020', '(11)95123-9434', '1'),
('Maria Conceição', 'mariaconceicao@gmail.com', '345216', '(13)3456-7809', '(13) 98766-9080', '2'),
('Maria Eduarda', 'mariaeduarda@gmail.com', '112233', '(11) 6545-9880', '(11)98765-6090', '3'),
('Marcos Fernando', 'mariafernando@gmail.com', '332211', '(12)4055-6490', '(11) 98866-5544', '4');

insert into sensor values
(null, 'DHT11', '1','1'), -- id1
(null, 'DHT11', '2', '2'), -- id2
(null, 'DHT11', '1', '3'), -- id3
(null, 'DHT11', '2', '4'); -- id4

insert into dadosSensor values
(null, '25', '14', '2022-12-03', '1'), 
(null, '21', '13', '2022-11-03', '2'), 
(null, '24', '15', '2022-10-03', '3'), 
(null, '28', '13', '2022-09-03', '4');

insert into sugestao values 
(null, 'Lorem', '1'),
(null, 'falta incrementar mais informações ao site de vocês.', '2'),
(null, 'TA legal', '3'),
(null, 'lorem', '4');

insert into dadosKpi values 
(null, '20', '30', '13', '14', '1'),
(null, '20', '30', '13', '14', '2'),
(null, '20', '30', '13', '14', '3'),
(null, '20', '30', '13', '14', '4');

insert into recuperacaoSenha values
(null, '2022-11-03', '1'),
(null, '2022-01-16', '2'),
(null, '2022-09-02', '3'),
(null, '2022-03-30', '4');
    
select * from usuario;
select * from fazenda;
select * from enderecoFazenda;
select * from sensor;
select * from dadosSensor;

select * from enderecoFazenda join fazenda
on fKEnderecoFazenda = idEnderecoFazenda;

select * from sensor join dadosSensor
on fkSensor = idSensor
where tipo = 'DHT11';

select nomeUsuario, nomeFazenda from usuario join fazenda
on idFazenda = fkfazenda;


