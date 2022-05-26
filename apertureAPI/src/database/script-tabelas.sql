-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!
/* para workbench - local - desenvolvimento */
CREATE DATABASE aperture;
USE aperture;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	subjectID int,
	nome VARCHAR(50),
	senha VARCHAR(50)
) AUTO_INCREMENT = 700;

/* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */