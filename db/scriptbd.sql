USE isee;

create table Maquinas (
sistemaOperacionalMaquina varchar(25),
fabricanteMaquina varchar(25),
arquiteturaMaquina varchar(25),
tempoDeAtividade long,
discoMaquina varchar(10),
ramMaquina varchar(10),
processadorMaquina varchar(10),
);

create table Historico (
idHistorico int primary key auto_increment,
usoRamHistorico varchar(10),
usoProcessadorHistorico varchar(10),
usoDiscoHistorico varchar(10),
dataHoraHistorico datetime default current_timestamp,
);

create table Alerta (
idAlerta int primary key auto_increment,
componente varchar(10),
nivelAlerta varchar(10),
dado varchar(10),
datahoraAlerta datetime,
);
