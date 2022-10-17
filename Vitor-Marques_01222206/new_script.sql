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

insert into fazenda values
(null, 'Pedaço de céu', 'Boa Vista', '10.210.520/0001-82', '1' ),
(null, 'Encanto', 'Bom Retiro', '45.301.096/0001-66', '2'),
(null, 'Flor-de-lis', 'Duartina', '70.064.979/0001-47', '3'),
(null, 'Templo', 'Laila', '71.505.461/0001-64', '4');


insert into hectare values
(null, '2', '1', '1'),
(null, '5', '2', '2'),
(null, '1', '3', '3'),
(null, '10', '4', '4');

insert into usuario (nomeUsuario, email, senha, telefoneFixo, telefoneCelular, fkFazenda) values 
(null, 'Joaquim Cruz', 'joaquimcruz@gmail.com', 'joaquim123', '(11) 4055-2020', '(11)95123-9434', '1'),
(null, 'Maria Conceição', 'mariaconceicao@gmail.com', 'maria123', '(13)3456-7809', '(13) 98766-9080', '2'),
(null, 'Maria Eduarda', 'mariaeduarda@gmail.com', 'mariaeduarda123', '(11) 6545-9880', '(11)98765-6090', '3'),
(null, 'Marcos Fernando', 'mariafernando@gmail.com', 'marcos123', '(12)4055-6490', '(11) 98866-5544', '4');


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
(null, 'Poderia incrementar a interface do app', '1'),
(null, 'Falta incrementar mais informações ao site de vocês.', '2'),
(null, 'Ta legal, mas ainda falta mais profissionalidade', '3'),
(null, 'Acho que seria interessante acrescentar mais informações sobre o produto, pois ainda estou com duvidas de como funciona', '4');

insert into dadosKpi values 
(null, '20', '30', '13', '14'),
(null, '20', '30', '13', '14'),
(null, '20', '30', '13', '14'),
(null, '20', '30', '13', '14');

insert into recuperacaoSenha values
(null,'634a1088da6f1', '2022-11-03 22:45:00', '1'),
(null, '634a10ca6b290', '2022-01-16 16:12:15', '2'),
(null, '634a10fd5508c', '2022-09-02 20:10:54', '3'),
(null, '634a110728480', '2022-03-30 12:45:45', '4');
    
-- selects com cada tabela e com uso do inner join
    
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


