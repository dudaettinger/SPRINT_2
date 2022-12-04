var dadoSensorModel = require("../models/SensorModel");

function buscarUltimosDadosensor(req, res) {

    const limite_linhas = 7;

    var idDados = req.params.idDados;

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    dadoSensorModel.buscarUltimosDadosensor(idDados, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarDadosensorTemporeal(req, res) {

    var idDados = req.params.idDados;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarDadosensorTemporeal(idDados).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimosDadosensor,
    buscarDadosensorTemporeal

}


