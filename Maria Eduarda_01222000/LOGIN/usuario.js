const labels = [
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
];

const data = {
    labels: labels,
    datasets: [{
        label: 'Temperatura',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: [30, 29, 28, 25, 22, 23],
    },
    {
        labels: labels,
        label: 'Umidade',
        backgroundColor: 'rgb(0, 0, 255)',
        borderColor: 'rgb(0, 0, 255)',
        data: [80, 82, 80, 85, 80, 83],
    }]
};

const labels2 = [
    'Janeiro',
    'Feveiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
];

const data2 = {
    labels: labels2,
    datasets: [{
        label: 'Temperatura Média',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: [22, 24, 27, 25, 23, 20, 18],
    },
    {
        labels: labels2,
        label: 'Umidade Média',
        backgroundColor: 'rgb(0, 0, 255)',
        borderColor: 'rgb(0, 0, 255)',
        data: [90, 89, 93, 87, 88, 82],
    }]
};






const config = {
    type: 'line',
    data: data,
    options: {}
};


const config2 = {
    type: 'bar',
    data: data2,
    options: {}
};


const resultado_setor1 = new Chart(
    document.getElementById('resultado_setor1'),
    config
);

const resultado_setor2 = new Chart(
    document.getElementById('resultado_setor2'),
    config2
);