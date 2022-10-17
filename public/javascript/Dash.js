
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
            label: 'Temperatura Setor 1',
            backgroundColor: 'Red',
            borderColor: 'Red',
            data: [30, 29, 28, 25, 22, 23],
        },
        {
            labels: labels,
            label: 'Temperatura Setor 2',
            backgroundColor: ' brown;',
            borderColor: 'brown',
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
            label: 'Umidade Setor 1',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [22, 24, 27, 25, 23, 20, 18],
        },
        {
            labels: labels2,
            label: 'Umidade Setor 2',
            backgroundColor: 'rgb(0, 0, 255)',
            borderColor: 'rgb(0, 0, 255)',
            data: [90, 89, 93, 87, 88, 82],
        }]
    };

    const labels3 = [
        '12:00',
        '13:00',
        '14:00',
        '15:00',
        '16:00',
        '17:00',
    ];

    const data3 = {
        labels: labels3,
        datasets: [{
            label: 'Temperatura Setor 1',
            backgroundColor: 'Red',
            borderColor: 'Red',
            data: [30, 29, 28, 25, 22, 23],
        },
        {
            labels: labels3,
            label: 'Temperatura Setor 2',
            backgroundColor: ' brown;',
            borderColor: 'brown',
            data: [80, 82, 80, 85, 80, 83],
        }]
    };


    const labels4 = [
        '12:00',
        '13:00',
        '14:00',
        '15:00',
        '16:00',
        '17:00',
    ];

    const data4 = {
        labels: labels4,
        datasets: [{
            label: 'Temperatura Setor 1',
            backgroundColor: 'Red',
            borderColor: 'Red',
            data: [30, 29, 28, 25, 22, 23],
        },
        {
            labels: labels4,
            label: 'Temperatura Setor 2',
            backgroundColor: ' brown;',
            borderColor: 'brown',
            data: [80, 82, 80, 85, 80, 83],
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


    const config3 = {
        type: 'bar',
        data: data3,
        options: {}
    };


    const config4 = {
        type: 'bar',
        data: data4,
        options: {}
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
        config
    );

    const resultado_setor4 = new Chart(
        document.getElementById('grafico4'),
        config2
    );