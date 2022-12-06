
// if (sessionStorage.NOME_USUARIO == null) {
//     location = 'login.html'
// }


var horas = [];
var temperaturas = [];
var umidades = [];
var mes = [];
var temperaturamensal = [];
var umidademensal = [];

 var periodo = 5000
intervalo = setInterval(recarregarGrafico, periodo);

function recarregarGrafico() {

    resultado_setor1.innerHTML = '';
    resultado_setor2.innerHTML = '';
    resultado_setor3.innerHTML = '';
    resultado_setor4.innerHTML = '';

    resultado_setor1.innerHTML = ' <canvas id="grafico" class="grafico_dash"></canvas>';
    resultado_setor2.innerHTML = ' <canvas id="grafico2" class="grafico_dash"></canvas>';
    resultado_setor3.innerHTML = ' <canvas id="grafico3" class="grafico_dash"></canvas>';
    resultado_setor4.innerHTML = ' <canvas id="grafico4" class="grafico_dash"></canvas>';

    horas = [];
    temperaturas = [];
    umidades = [];
    mes = [];
    temperaturamensal = [];
    umidademensal = [];

    carregarDadosGraficoLinha()
}

function carregarDadosGraficoLinha() {

    fetch("/avisos/listar").then(function (resposta) {
        if (resposta.ok) {

            resposta.json().then(function (resposta) {
                console.log("Dados recebidos: ", JSON.stringify(resposta));

                for (let i = 0; i < resposta.length; i++) {
                    horas.push(resposta[i].hora);
                    temperaturas.push(resposta[i].temperatura);
                    umidades.push(resposta[i].umidade);
                }

                carregarDadosGraficoBarra()

            });
        } else {
            throw ('Houve um erro na API!');
        }
    }).catch(function (resposta) {
        console.error(resposta);
    });

}


function carregarDadosGraficoBarra() {
    fetch("/avisos/listar_mes").then(function (resposta) {
        if (resposta.ok) {

            resposta.json().then(function (resposta) {
                console.log("Dados recebidos: ", JSON.stringify(resposta));

                for (let i = 0; i < resposta.length; i++) {
                    mes.push(nomeMes(resposta[i].mes) + " / " + resposta[i].ano);
                    temperaturamensal.push(resposta[i].media_temperatura);
                    umidademensal.push(resposta[i].media_umidade);
                }

                criarGraficos();

            });
        } else {
            throw ('Houve um erro na API!');
        }
    }).catch(function (resposta) {
        console.error(resposta);
    });
}

function criarGraficos() {


    const data = {
        labels: horas,
        datasets: [{
            label: 'Temperatura (°C) por hora',
            backgroundColor: '#99ff66',
            borderColor: '#99ff66',
            data: temperaturas,
        }],
    };


    const data2 = {
        labels: horas,
        datasets: [{
            label: 'Umidade (%) por hora',
            backgroundColor: '#99ff66',
            borderColor: '#99ff66',
            data: umidades,
        }]
    };


    const data3 = {
        labels: mes,
        datasets: [{
            label: 'Temperatura (°C) por mês',
            backgroundColor: '#99ff66',
            borderColor: '#99ff66',
            data: temperaturamensal,
        }]
    };


    const data4 = {
        labels: mes,
        datasets: [{
            label: 'Umidade (%) por mês',
            backgroundColor: '#99ff66',
            borderColor: '#99ff66',
            data: umidademensal,
        }],
    };


    const data5 = {
        labels: [
            'Setembro Outubro Novembro',
            'Dezembro  Janeiro Fevereiro',
        ],
        datasets: [{
            label: 'Média de Receita semestral (%)',
            data: [33.33, 66.67],
            backgroundColor: [
                'rgb(255, 205, 86)',
                '#B19CD9',


            ],
            borderColor: 'black',
            hoverOffset: 4
        }]
    };
    ;


    const data6 = {
        labels: [
            'Setembro Outubro Novembro',
            'Dezembro Janeiro Fevereiro',
        ],
        datasets: [{
            label: 'Média de Perda da Safra semestral',
            data: [18.6, 22.4,],
            backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)',
                '#99ff66',
                '#ffff00',
                '#B19CD9'

            ],
            borderColor: 'black',
            hoverOffset: 4
        }]
    };
    ;



    const config = {
        type: 'line',
        data: data,
        options: {
            color: 'white',
            responsive: true,
            scales: {
                y: {
                    ticks: { color: 'white', beginAtZero: true }
                },
                x: {
                    ticks: { color: 'white', beginAtZero: true }
                }
            }
        }
    };


    const config2 = {
        type: 'line',
        data: data2,
        options: {
            color: 'white',
            responsive: true,
            scales: {
                y: {
                    ticks: { color: 'white', beginAtZero: true }
                },
                x: {
                    ticks: { color: 'white', beginAtZero: true }
                }
            }
        }
    };


    const config3 = {
        type: 'bar',
        data: data3,
        options: {
            color: 'white',
            responsive: true,
            scales: {
                y: {
                    ticks: { color: 'white', beginAtZero: true }
                },
                x: {
                    ticks: { color: 'white', beginAtZero: true }
                }
            }
        }
    };


    const config4 = {
        type: 'bar',
        data: data4,
        options: {
            color: 'white',
            responsive: true,
            scales: {
                y: {
                    ticks: { color: 'white', beginAtZero: true }
                },
                x: {
                    ticks: { color: 'white', beginAtZero: true }
                }
            }
        }
    };

  

    const resultado_setor1 = new Chart(
        document.getElementById('grafico'),
        config
    );

    const resultado_setor2 = new Chart(
        document.getElementById('grafico2'),
        config2
    );
    const resultado_setor3 = new Chart(
        document.getElementById('grafico3'),
        config3
    );

    const resultado_setor4 = new Chart(
        document.getElementById('grafico4'),
        config4
    );


}

function nomeMes(mes) {
    switch (mes) {
        case 1: 
            return 'Janeiro'
            break;
            case 2: 
            return 'Fevereiro'
            break;
            case 3: 
            return 'Março'
            break;
            case 4: 
            return 'Abril'
            break;
            case 5: 
            return 'Maio'
            break;
            case 6: 
            return 'Junho'
            break;
            case 7: 
            return 'Julho'
            break;
            case 8: 
            return 'Agosto'
            break;
            case 9: 
            return 'Setembro'
            break;
            case 10: 
            return 'Outubro'
            break;
            case 11: 
            return 'Novembro'
            break;
    
        default: 
        return 'Dezembro'
            break;
    }
}
