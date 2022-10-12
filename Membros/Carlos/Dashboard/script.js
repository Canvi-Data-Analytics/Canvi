const labelsLine = [
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00'
];

const dataLine = {
    labels: labelsLine,
    datasets: [{
        label: 'Temperatura',
        data: [30, 29, 28, 25, 22, 23],
        borderColor: 'rgb(0, 0, 255)',
        backgroundColor: 'rgb(0, 0, 255)'
    },
    {
        labels: labelsLine,
        label: 'Umidade',
        data: [80, 82, 80, 85, 80, 83],
        borderColor: 'rgb(75, 192, 192)',
        backgroundColor: 'rgb(75, 192, 192)'
    }]
};

const configLine = {
    type: 'line',
    data: dataLine,
};

const myChart = new Chart(
    document.getElementById('myChartLinhas'),
    configLine
);

// GRÁFICO BARRA
const labelsBar = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
];

const dataBar = {
    labels: labelsBar,
    datasets: [{
        label: 'Temperatura Média',
        data: [22, 24, 27, 23, 20, 18],
        backgroundColor:
            'rgba(255, 99, 132)', 
        borderColor:
            'rgb(255, 99, 132)',
        borderWidth: 1
    },
    {
        label: 'Umidade Média',
        data:[90,89,93,87,88,82],
        backgroundColor: 'rgba(255, 159, 64)',
        borderColor:
            'rgb(255, 159, 64)',
        borderWidth: 1
    }

]
};

const configBar = {
    type: 'bar',
    data: dataBar,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    },
};

const myChartBars = new Chart(
    document.getElementById('canavial1'),
    configBar
);