var usuarioModel = require("../models/usuarioModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA usuarioController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
    usuarioModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function entrar(req, res) {
    var idUser = req.body.idServer;
    var senha = req.body.senhaServer;

    if (idUser == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {
        
        usuarioModel.entrar(idUser, senha)
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                    if (resultado.length == 1) {
                        console.log(resultado);
                        res.json(resultado[0]);
                    } else if (resultado.length == 0) {
                        res.status(403).send("ID e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var id = req.body.idServer;
    var nome = req.body.nomeServer;
    var idade = req.body.idadeServer;
    var cidade = req.body.cidadeServer;
    var senha = req.body.senhaServer;
    var dataTeste = req.body.data_testeServer;
    var desempenho = req.body.desempenhoServer;
    var chamber = req.body.chamberServer

    // Faça as validações dos valores
    if (id == undefined) {
        res.status(400).send("Seu nome não está definido");
    } else if (nome == undefined) {
        res.status(400).send("Seu email não está definido");
    } else if (idade == undefined) {
        res.status(400).send("Sua idade não está definida");
    } else if (cidade == undefined) {
        res.status(400).send("Seu cidade não está definida");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha não está definida");
    } else if (dataTeste == undefined) {
        res.status(400).send("Sua data não está definida");
    } else if (desempenho == undefined) {
        res.status(400).send("Seu desempenho não está definido");
    } else if (chamber == undefined) {
        res.status(400).send("Sua chamber não está definida");
    } else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(id, nome, idade, cidade, senha, dataTeste, desempenho, chamber)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    entrar,
    cadastrar,
    listar,
    testar
}