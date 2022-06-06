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
	(2, 7, 'Média'),
	(3, 7, 'Alta'),
	(4, 7, 'Baixa'),
	(5, 7, 'Baixa'),
	(6, 6, 'Alta'),
	(7, 6, 'Média'),
	(8, 6, 'Alta'),
	(9, 6, 'Baixa'),
	(10, 6, 'Baixa'),
    (11, 5, 'Alta'),
	(12, 5, 'Média'),
	(13, 5, 'Alta'),
	(14, 5, 'Baixa'),
	(15, 5, 'Baixa'),
    (16, 4, 'Alta'),
	(17, 4, 'Média'),
	(18, 4, 'Alta'),
	(19, 3, 'Baixa'),
	(20, 3, 'Baixa');
    
select * from TestSubject;
select * from TestChamber;

select * from TestSubject, TestChamber where fkChamber = idChamber and subjectID = 7796;

SELECT * FROM TestSubject, TestChamber WHERE subjectID = '${id}' AND subjectSenha = '${senha}';
SELECT * FROM TestSubject, TestChamber WHERE fkChamber = idChamber AND subjectID = '7796' AND subjectSenha = '2076';

-- drop database Aperture;