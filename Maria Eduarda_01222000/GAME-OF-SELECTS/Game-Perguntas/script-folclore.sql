CREATE DATABASE folclore;
USE folclore;

CREATE TABLE lenda(
idLenda INT PRIMARY KEY AUTO_INCREMENT,
personagem VARCHAR(45),
descricao VARCHAR(300)
);

CREATE TABLE cantiga(
idCantiga INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

CREATE TABLE brincadeira (
idBrincadeira INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

CREATE TABLE comidas (
idComidas INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
historia VARCHAR(100)
);

CREATE TABLE regiao (
idRegiao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
estado VARCHAR (45)
);

CREATE TABLE literatura (
idLiteratura INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
tipoTextual VARCHAR (200)
);

CREATE TABLE danca(
idDanca INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(45),
fkcantiga INT,
FOREIGN KEY (fkcantiga) REFERENCES cantiga(idCantiga)
);

CREATE TABLE festa(
idFesta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(400),
fkDanca INT,
FOREIGN KEY(fkDanca) REFERENCES Danca(idDanca)
);

CREATE TABLE localizacao(
diaFesta INT,
mes INT,
fkFesta INT,
FOREIGN KEY (fkFesta) REFERENCES festa(idFesta),
fkRegiao int,
FOREIGN KEY (fkRegiao) REFERENCES regiao(idRegiao),
PRIMARY KEY (fkFesta,fkRegiao)
);

create table cultura(
anoCriacao DATE,
fkLenda INT,
FOREIGN KEY (fkLenda) REFERENCES lenda(idLenda),
fkRegiao int,
FOREIGN KEY (fkRegiao) REFERENCES regiao(idRegiao)
);

CREATE TABLE jogos (
fkFesta INT,
fkBrincadeira INT,
preco DECIMAL (10,2),
jogadas INT,
FOREIGN KEY (fkFesta) REFERENCES festa(idFesta),
FOREIGN KEY (fkBrincadeira) REFERENCES brincadeira(idBrincadeira),
PRIMARY KEY (fkFesta,fkBrincadeira)
);

CREATE TABLE comidasDeFestas (
fkFesta INT,
fkComidas INT,
preco DECIMAL(10, 2),
FOREIGN KEY (fkFesta) REFERENCES festa (idFesta),
FOREIGN KEY (fkComidas) REFERENCES comidas (idComidas),
PRIMARY KEY (fkFesta, fkComidas)
);

CREATE TABLE culturaLiteraria (
fkRegiao INT,
fkLiteratura INT,
FOREIGN KEY (fkRegiao) REFERENCES regiao (idRegiao),
FOREIGN KEY (fkLiteratura) REFERENCES literatura (idLiteratura)
);

ALTER TABLE comidas MODIFY COLUMN historia VARCHAR(500);
ALTER TABLE cultura MODIFY COLUMN anoCriacao VARCHAR(20);
ALTER TABLE localizacao MODIFY COLUMN mes VARCHAR(45);
ALTER TABLE localizacao MODIFY COLUMN diaFesta VARCHAR(45);
ALTER TABLE culturaLiteraria MODIFY COLUMN dataDeCriacao CHAR(4);


INSERT INTO Lenda VALUES 
(null, "Lenda do Saci", "saci é negro e possui apenas uma perna, com a qual se locomove rapidamente."),
(null, "Lenda da Mula sem cabeça", "A mula sem cabeça é um monstro do folclore brasileiro que se manifesta quando uma mulher namora um padre. Por maldição ela é transformada em mula."),
(null, "Lenda do Curupira", "Personagem travesso do folclore brasileiro, o Curupira é a representação de um menino com cabelos vermelhos e pés virados para trás. A origem do nome é tupi-guarani e significa corpo de menino."),
(null, "Lenda do Boto", "A lenda do Boto é originária da região amazônica sendo também conhecida pela denominação boto cor-de-rosa ou Uauiará."),
(null, "Lenda do lobsomen", "A lenda do Lobisomem tem origem europeia. Ela retrata um monstro violento com formas humanas e de lobo, que se alimenta de sangue."),
(null, "Lenda do boitatá", "O Boitatá é uma lenda folclórica conhecida em outras regiões do Brasil pelos nomes Baitatá, Biatatá, Bitatá e Batatão. "),
(null, "Lenda da Cuca", "De origem portuguesa, a lenda da Cuca está associada muitas vezes com o “bicho papão”. Ela é uma personagem muito temida pelas crianças, representada por velha feia e malvada com cara de jacaré que raramente dorme."),
(null, "Lenda do Negrinho do Pastoreio", "De origem afro-cristã e pertencente ao folclore do sul do país, o Negrinho do Pastoreio conta a história de um menino escravo que tinha um patrão maldoso. Quando foi pastorear os cavalos, acabou por perder um cavalo baio."),
(null, "Lenda da Iara", "Conhecida como Iara ou Uiara, a lenda da mãe d’água é de origem tupi. Iara significa “Senhora das Águas”. Esta personagem é representada por uma sereia belíssima que atrai os pescadores com suas doces canções a fim de matá-los."),
(null, "Lenda do Acutipupu", "Criatura que hora é homem, hora é mulher. Com corpo masculino, fecunda mulheres que tem meninos valentes, enquanto com o corpo feminino,dá à luz, a belas meninas."),
(null, "Lenda do Ahó Ahó", "Monstro parecido com uma ovelha que devora as pessoas, especialmente os índios que fugiam das missões jesuítas para regressar as suas aldeias."),
(null, "Lenda da Alamoa", "Mulher atraente que seduz marinheiros e pescadores, tal como as sereias, e se transforma numa figura monstruosa desaparecendo com as suas vítimas."),
(null, "Lenda do Barba Ruiva", "Homem encantado que, ao longo do dia é capaz de se transformar em menino, moço e velho. Abandonado por sua mãe, ele foi acolhido por Iara."),
(null, "Lenda do Bicho-papão", "Monstro que fica embaixo da cama, atrás da porta ou dentro do armário e assusta as crianças malcriadas e mal-educadas durante a noite e que, ainda, pode comer as mais teimosas."),
(null, "Lenda do Bradador", "Alma penada que sai vagando pelo mato às sextas-feiras depois da meia-noite. O motivo de ter sido devolvido à terra depois de enterrado é o morto não ter pagado todos os seus pecados."),
(null, "Lenda do Caipora", "Criatura, homem ou mulher, que é a protetora dos animais e das florestas. Além de assustar os caçadores com uivos altos, ela os distrai com pistas falsas, fazendo eles se perderem na floresta."),
(null, "Lenda do Cobra Grande", "Também conhecida como Cobra Honorato ou Norato, seu pai é uma cobra gigante e sua mãe é uma índia, que abandona seus dois filhos no rio após dar à luz e verificar que ambos têm aspecto de cobra."),
(null, "Corpo-seco", "Espírito de homem que recebeu a maldição de ficar vagando pela noite, porque em vida cometeu pecado imperdoável, e seu corpo não é aceito nem por Deus, nem pelo diabo, e a própria terra o rejeita."),
(null, "Lenda do Guaranáe", "Os olhos de um indiozinho muito estimado na tribo foi plantado a fim de que nascesse uma plantinha que desse energia às pessoas, dando origem ao guaraná. O menino tinha sido morto pelo invejoso deus da escuridão."),
(null, "Lenda do Jurupari", "Deus da escuridão, visitava os índios durante o sono para provocar pesadelos. Em outras versões da lenda, Jurupari é um legislador de povos indígenas, que ao nascer revelou que traria leis aos homens."),
(null, "Lenda da Mãe-de-Ouro", "Uma bonita mulher que voa, assume a forma de bola de fogo, e consegue encontrar ouro escondido para o proteger da extração, motivo pelo qual é conhecida como protetora dos tesouros."),
(null, "Lenda da Mandioca", "Mani, uma indiazinha muito querida, morreu e foi enterrada por sua mãe na sua oca, que com seu choro parecia regar a terra. Nesse lugar, nasceu um tubérculo nutritivo, a mandioca."),
(null, "Lenda do Papa-Figo", "Um velho corcunda e barbudo, também conhecido como “homem do saco”, justamente por vagar pelas ruas com um saco nas costas onde guarda crianças desobedientes para, de seguida, comer os seus fígados."),
(null, "Lenda do Papai Noel", "Velhinho simpático que, na noite de Natal, visita as casas a fim de distribuir presentes, que deixa debaixo da árvore, às crianças que se portaram bem durante o ano."),
(null, "Lenda da Vitória-Régia", "Uma índia que se apaixonou por Jaci, o deus da Lua, esperava por ele todas as noites. Vendo a luz de Jaci refletida no rio, a índia Naiá inclina-se para beijá-lo e morre afogada, sendo transformada em uma planta conhecida como estrela das águas.");

INSERT INTO cantiga VALUES 
(null, 'Ciranda, Cirandinha'),
(null, 'Capelinha de Melão'),
(null, 'Escravos de Jó'),
(null, 'Peixe Vivo'),
(null, 'A Galinha do Vizinho'),
(null, 'Borboletinha'),
(null, 'Meu Limão, Meu Limoeiro'),
(null, 'A Barata Diz que Tem'),
(null, 'Marcha soldado');

INSERT INTO brincadeira VALUES
(null, 'Dança da cadeira'),
(null, 'Batata quente'),
(null, 'Forca'),
(null, 'Cabra-cega'),
(null, 'Gato-mia'),
(null, 'Cabo de guerra'),
(null, 'Pular corda'),
(null, 'Esconde-esconde'),
(null, 'Amarelinha'),
(null, 'Pega-pega'),
(null, 'Pipa'),
(null, 'Pião'),
(null, 'Estilingue'),
(null, 'Bolas de gude');

INSERT INTO comidas VALUES 
(1, 'canjica', 'A canjica, ao lado da moqueca, da paçoca, do mingau, do beiju, da carne moqueada, seria uma deliciosa herança dos Tupinambá, índios brasileiros que habitavam o litoral, quando da chegada dos europeus nos começos do século 16.'),
(2, 'cuscuz', 'A origem do cuscuz é atribuída ao Oriente Médio, mais especificamente à cidade de Maghreb, localizada no norte da África.'),
(3, 'maçã do amor', 'A maçã do amor é uma invenção paulistana. O catalão José Maria Farre Angles desembarcou com a família no Brasil em 1954 e, cheio de dificuldades, criou o doce no ano seguinte para conseguir sobreviver.'),
(4, 'arroz de cuxá', 'De origem maranhense, esse prato é um tipo de molho feito com vinagreira (planta muito encontrada no Maranhão), diferentes especiarias (como o pimentão) e farinha de mandioca.'),
(5, 'empada', 'Sua origem vem do século XIX, nos pastelões portugueses, que são grandes tortas salgadas com diversos recheios. Naquela época, havia versões pequenas dos pastelões, que eram conhecidas como “empadas de caixa”.'),
(6, 'feijoada', 'A feijoada ainda carrega uma forte mitologia. Por muito tempo se considerava que a feijoada seria um prato “inventado” nas senzalas. Os escravos cozinhariam o feijão preto (originário) da América com os restos de carne que os senhores de engenho desprezavam.'),
(7, 'acarajé', 'Sua origem vem do mito da relação de Xango com suas esposas Oxum e Iansã. O bolinho se tornou assim um tipo de oferenda entre esses orixás. Ele é considerado por muitos como uma comida sagrada. Por este motivo sua receita, além de não poder ser modificada, deve ser preparada pelas filhas-de-santo.'),
(8, 'bolo-rei', 'A origem do bolo de reis remonta ao tempo dos festejos romanos de Saturnália. Estes tinham por hábito eleger o "rei da festa" durante os banquetes comemorativos, o que era feito colocando uma fava seca (símbolo da fecundidade) numa doce torta redonda, que quem achasse se convertia no rei da fava ou rei da festa.'),
(9, 'caril de amendoim', 'Caril de amendoim é um prato típico da culinária de Moçambique, em particular da região sul do país, incluindo as províncias de Maputo, Gaza e Inhambane.'),
(10, 'tortinho', 'Um bolinho caipira, feito de farinha de milho branca e recheio de carne moída, mas em formato de meia lua, pode ser considerado um dos símbolos da Festa do Divino e também um salgado tipicamente mogiano.'),
(11, 'tucupi', 'O líquido que sai da mandioca ralada espremida, depois de separado do amido decantado, é cozido com temperos e vira o tucupi. De origem indígena, ele é um dos ingredientes marcantes da cozinha do norte do País e está em pratos tradicionais como o tacacá e o pato no tucupi.'),
(12, 'maniçoba', 'A Maniçoba é um prato de origem indígena, típico da culinária paraense e amapaense. Pela origem da folha de que é produzido, surgiu provavelmente entre aldeias indígenas no norte brasileiro, embora seja comumente apontado como uma comida paraense. Tem como principal ingrediente a maniva, a folha da mandioca moída.'),
(13, 'tacacá', 'A provável origem do tacacá está na culinária indígena. Ao que tudo indica, o prato é uma variação do mani poi, uma sopa apreciada pelos indígenas, muito antes da chegada dos europeus na região.'),
(14, 'kassler', 'Kassler é uma iguaria típica da culinária da Alemanha, da culinária da Áustria, onde é conhecida como selchkarree,[1] e da Dinamarca, onde apenas se usa o lombo e têm o nome de hamburgerryg. São designações dadas a pedaços de carne de porco salgados e fumados. As carnes mais usadas são as do pescoço e do lombo, embora costeletas e carne da barriga também sejam usadas.'),
(15, 'weisswurst', 'Prato típico da região da Bavária, o weisswurst é a famosa salsicha branca. Uma curiosidade sobre esse prato é que essa salsicha é consumida sem a pele. Ela é feita de carne de vitela e de porco, temperada com cebola e salsa fresca. Existe uma tradição local que diz que a salsicha branca só deve ser consumida até o meio-dia, por isso, é bem comum algumas pessoas a saborearem pela manhã, com mostarda doce, brezel e uma cerveja.'),
(16, 'frikadellen', 'Nada mais é do que um bolinho de carne alemão, mas que recebe um nome diferente em cada região da Alemanha, Este tão famoso bolinho tem em sua receita carne bovina e suína, bacon e cebola e geralmente tem como acompanhamento batatas cozidas, salada de batata ou até mesmo servido dentro de um pão.'),
(17, 'paçoca de carne seca', 'A paçoca de carne seca é um prato que se encontra em quase todo o Brasil, herança da tradição alimentar dos índios, que tinham como base da alimentação a mandioca.'),
(18, 'farofa-de-dendê', 'A Farofa de Dendê é um dos acompanhamentos típicos da Moqueca, mas faz parte também da comida ritual do candomblé. Esta farofa, que é considerada hoje como um prato típico da culinária brasileira de origem africana, utiliza a farinha de mandioca como ingrediente principal, cuja origem é dos nossos indígenas.'),
(19, 'empadão goiano', 'Acredita-se que o ancestral do empadão goiano seja europeu, consumido principalmente em Portugal e na Espanha, sendo basicamente uma torta salgada recheada com vários tipos de carnes');

INSERT INTO regiao(nome,estado) VALUES 
('sul','Paraná (PR)'),
('sul','Santa Catarina (SC)'),
('sul',' Rio Grande do Sul (RS)'),
('sudeste',' "Espírito Santo (ES)'),
('sudeste','Minas Gerais (MG)'),
('sudeste','Rio de Janeiro(RJ)'),
('sudeste','São Paulo(SP)'),
('nordeste','Maranhão(MA)'),
('nordeste','Piauí(PI)'),
('nordeste','Ceará(CE)'),
('nordeste','Rio Grande do Norte(RN)'),
('nordeste','Paraíba(PB)'),
('nordeste','Pernambuco(PE)'),
('nordeste','Alagoas(AL)'),
('nordeste','Sergipe(SE)'),
('nordeste','Bahia(BA)'),
('norte','Amazonas (AM)'),
('norte','Pará (PA)'),
('norte','Acre (AC)'),
('norte','Roraima (RR)'),
('norte','Rondônia (RO)'),
('norte','Amapá (AP)'),
('norte','Tocantins (TO)'),
('centro oeste','Goiás (GO)'),
('centro oeste','Mato Grosso (MT)'),
('centro oeste','Mato Grosso do Sul (MS) '),
('centro oeste','Distrito Federal (DF)');

INSERT INTO literatura(nome,tipoTextual) VALUES 
('Sítio do Pica-pau Amarelo','expositivo-argumentativo'),
('A Turma do Saci Pererê ','lenda'),
('Cordel','informativo'),
('A Cigarra e a Formiga','fabula'),
('A Tartaruga e a Lebre','fabula'),
('A Raposa e as Uvas','fabula');

insert into culturaLiteraria values
(5, 1, '1977'),
(10, 2, '1959'),
(2, 3, '1893'),
(14, 4, '1934'),
(25, 5, '1935'),
(11, 6, '1974');

INSERT INTO danca VALUES
(null, 'ciranda','Formação em círculo',1 ),
(null, 'Cai cai balao','Passeatas em grupo', 2),
(null, 'caxangá','Corrida em ziguezague',3 ),
(null, 'Peixinho Vivo','Rodinha e de mãos dadas',4 ),
(null, 'Galinha','Círculo com os participantes agachados',5 ),
(null, 'Borboletinha','Bambole',6 ),
(null, 'Meu limão','Dança é composta por casais',7 ),
(null, 'A barata','Corridas em circulo',8 ),
(null, 'Dia do Soldado','Substituir a palavra MARCHA na musica',9 );

INSERT INTO festa VALUES 
(null, "Festas juninas", "Entendida com uma festa multicultural, as Festas Juninas são comemoradas durante todo mês de junho em todas as regiões do Brasil, porém, com mais força na região Nordeste. Por conta da sua ligação com a religião são lembrados nessa época: Santo Antônio, São Pedro e São João.", null),
(null, "Bumba meu boi", "Típica das regiões norte e nordeste, a festa do Bumba meu boi inclui muita dança, desfiles e encenações teatrais da lenda, que conta como a ressurreição de um dos bois preferidos do patrão de Mãe Catirina e Pai Francisco deu origem a essa tradicional comemoração brasileira", null),
(null, "Carnaval", "O Carnaval é uma das festas brasileiras mais conhecidas no mundo. De origem pagã, desde o início o carnaval cativou as pessoas, que podiam se divertir escondendo a sua identidade e trocando os papéis sociais mediante o uso de máscaras - tradição que surgiu em Veneza.", null),
(null, "Folia de reis", "De tradição católica, a Folia de reis é uma festa folclórica também conhecida como Reisado ou Festa de Santos Reis. Comemorada entre os dias 24 de dezembro e 6 de janeiro, celebra a ocasião em que, segundo a história, os Reis Magos conheceram o Menino Jesus.", null),
(null, "Congada", "Sem data fica, a Congada é uma manifestação cultura e religiosa que costuma ser celebrada em maio e outubro - por serem os meses dedicados a Nossa Senhora - ou dezembro.", null),
(null, "Festa do Divino", "Essa festa religiosa comemora a descida do Espírito Santo 50 dias depois do domingo da Páscoa, e tem seu ponto alto numa procissão que conta com a figura de um imperador - eleito por sorteio ou escolhido pelo bispo. O imperador é responsável pela organização da festa.", null),
(null, "Círio de Nazaré", "O Círio de Nazaré é a maior festa religiosa do Brasil, registrado desde 2004 como Patrimônio Cultural de Natureza Imaterial.", null),
(null, "Oktoberfest", "A Oktoberfest é uma das festas mais populares do sul do Brasil, cuja mais conhecida é a realizada em Blumenau, Santa Catarina. De tradição alemã, a Oktoberfest nasceu em Munique, na celebração do casamento do rei bávaro Luís I, em 1810.", null),
(null, "Festa do Peão de Barretos", "Muito tradicional da região sudeste, a Festa do Peão de Boiadeiro de Barretos realiza-se em agosto e é organizada pela Fundação de “Os Independentes”.", null),
(null, "Cavalhadas", "Com a duração de três dias, a festa consiste em desfiles a cavalo ao som de muita música. Vestindo trajes típicos - de veludo, muito coloridos e brilhantes - os participantes encenam batalhas entre cristãos (vestidos de azul) e mouros (vestidos de vermelho).", null),
(null, "Lavagem do Bonfim", "A Lavagem da escadaria do Bonfim é uma das festas mais populares na Bahia. Realiza-se na segunda quinta-feira do ano, reunindo sincretismo religioso, culinária, música e a folia típica dos baianos.", null),
(null, "Fogaréu", "O Fogaréu é mais uma festa tradicional de Goiás. Trata-se de uma procissão católica, acompanhada por uma banda, que se realiza na quinta-feira da semana santa pelas ruas da cidade de Goiás, partindo da igreja/museu da Boa Morte.", null),
(null, "Romaria de Finados de Juazeiro do Norte", "A Romaria de Finados de Juazeiro do Norte é uma homenagem a Padre Cícero. A romaria reúne milhares de devotos que visitam o túmulo do padre carismático e conhecido carinhosamente como Padim Ciço.", null);

INSERT INTO localizacao VALUES
('1 a 30', 'junho', '1', '2'),
('30', 'junho', '2', '3'),
('1 a 29', 'fevereiro', '3', '4'),
('6', 'janeiro', '4', '5'),
('8 a 10', 'outubro', '5', '10'),
('7 a 17', 'julho', '6', '12'),
('9', 'outubro', '7', '13'),
('17 a 3', 'setembro/outubro', '8', '24'),
('18 a 28', 'agosto', '9', '14'),
('5 a 7', 'junho', '10', '23'),
('13', 'janeiro', '11', '11'),
('14', 'abril', '12', '11'),
('29-02', 'outubro/novembro', '13', '15');

INSERT INTO cultura VALUES
(1560, 1, 1),
(1972, 2, 2),
('1534 - 1597', 3, 3),
(1937, 4, 4),
(1928,5,5),
(1560, 6, 6),
(1921,7,7),
(1937,8,8),
(1585,9,9),
(1540,10,10),
(1930,11,11),
(1547,12,12),
(1568,13,13),
(1560,14,13),
(1923,15,14),
(1557,16,15),
(1532,17,16),
(1545,18,17),
(1588,19,18),
(1936,20,19),
(1960,21,20),
(1543,22,22),
(1532,23,24);

INSERT INTO jogos VALUES
(1, 1, '0', 1),
(1, 13, '5.00', 3);

INSERT INTO comidasDeFestas VALUES
(1, 1, 4.09),
(1, 2, 5.00),
(1, 3, 2.00),
(2, 4, 15.00),
(3, 5, 3.00),
(3, 6, 25.00),
(3, 7, 40.00),
(4, 8, 180.50),
(5, 9, 6.00),
(6, 10, 20.00),
(7, 11, 18.00),
(7, 12, 16.00),
(7, 13, 15.00),
(8, 14, 30.00),
(8, 15, 32.00),
(8, 16, 48.00),
(9, 17, 8.00),
(11, 18, 12.00),
(12, 19, 15.00);








