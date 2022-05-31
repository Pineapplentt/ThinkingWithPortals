create database Aperture;
use Aperture;

create table TestSubject (
	subjectID int primary key,
    subjectNome varchar(50),
    subjectIdade int,
    subjectCidade varchar(50),
	subjectSenha VARCHAR(50)
    );
    
create table TestChamber (
	idChamber int primary key,
    nomeChamber varchar(50),
    nivelChamber varchar(50),
    dificuldadeChamber varchar(50)
    );
    
create table Test (
    fkSubject int,
	fkChamber int,
    foreign key (fkSubject) references TestSubject (subjectID),
    foreign key (fkChamber) references TestChamber (idChamber),
    DataHora datetime,
    desempenhoGeralSubject varchar(50),
    resistenciaTeste decimal(3,2)
    );

select * from TestSubject;

-- drop database Aperture;