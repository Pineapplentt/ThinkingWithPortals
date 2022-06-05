create database Aperture;
use Aperture;

create table TestChamber (
	idChamber int primary key,
    setor int,
    dificuldadeChamber varchar(10)
    );

create table TestSubject (
	subjectID int primary key,
    subjectNome varchar(50),
    subjectIdade int,
    subjectCidade varchar(50),
	subjectSenha VARCHAR(50),
    dataTeste varchar(30),
    desempenhoGeral int,
    fkChamber int,
    foreign key (fkChamber) references TestChamber (idChamber)
    );
    
insert into TestChamber values 
	(1, 7, 'Alta'),
	(2, 4, 'Média'),
	(3, 2, 'Alta'),
	(4, 9, 'Baixa'),
	(5, 9, 'Baixa');
    
select * from TestSubject;
select * from TestChamber;


-- drop database Aperture;