// Definir las opciones del gráfico (sin la serie de datos)
const barChartOptions = {
    series: [
        {
            name: "Cantidad",
            data: [], // Aquí se llenarán los datos dinámicamente
            color: "#115691",
        },
    ],
    chart: {
        sparkline: {
            enabled: false,
        },
        type: "bar",
        width: "100%",
        height: 400,
        toolbar: {
            show: false,
        },
    },
    plotOptions: {
        bar: {
            horizontal: true,
            columnWidth: "100%",
            borderRadiusApplication: "end",
            borderRadius: 6,
            dataLabels: {
                position: "top",
            },
        },
    },
    legend: {
        show: true,
        position: "bottom",
    },
    dataLabels: {
        enabled: false,
    },
    tooltip: {
        shared: true,
        intersect: false,
        formatter: function (value) {
            return value;
        },
    },
    xaxis: {
        labels: {
            show: true,
            style: {
                fontFamily: "Inter, sans-serif",
                cssClass: 'text-xs font-normal fill-gray-500 dark:fill-gray-400',
            },
            formatter: function (value) {
                return value;
            },
        },
        categories: [], // Las categorías (meses) se llenarán dinámicamente
        axisTicks: {
            show: false,
        },
        axisBorder: {
            show: false,
        },
    },
    yaxis: {
        labels: {
            show: true,
            style: {
                fontFamily: "Inter, sans-serif",
                cssClass: 'text-xs font-normal fill-gray-500 dark:fill-gray-400',
            },
        },
    },
    grid: {
        show: true,
        strokeDashArray: 4,
        padding: {
            left: 2,
            right: 2,
            top: -20,
        },
    },
};

// Mapeo de los nombres de los meses en inglés a los abreviados en español
const monthMapping = {
    "January": "Ene",
    "February": "Feb",
    "March": "Mar",
    "April": "Abr",
    "May": "May",
    "June": "Jun",
    "July": "Jul",
    "August": "Ago",
    "September": "Sep",
    "October": "Oct",
    "November": "Nov",
    "December": "Dic"
};

// Hacer la solicitud al backend para obtener las revelaciones
fetch(`${window.location.origin}/femisalud/api/get-revelations-by-patient`)
    .then(response => response.json())  // Obtener la respuesta como JSON
    .then(data => {
        // Aplanar el array de datos (array de arrays) para acceder fácilmente a los elementos
        const flattenedData = data.flat(); // Aplana el array de arrays

        // Inicializar un arreglo con 12 elementos en 0
        const counts = new Array(12).fill(0);

        // Llenar el arreglo de counts con los datos recibidos
        flattenedData.forEach(item => {
            // Obtener el mes en español a partir del nombre del mes en inglés
            const monthInSpanish = monthMapping[item.revelationMonth];
            const monthIndex = monthInSpanish ? Object.values(monthMapping).indexOf(monthInSpanish) : -1; // Obtener el índice del mes en el mapeo
            if (monthIndex !== -1) {
                counts[monthIndex] = item.totalRevelations; // Asignar el total de revelaciones al índice correspondiente
            }
        });

        // Las categorías (meses) en español
        const months = Object.values(monthMapping);

        // Llenar las categorías (meses) y los datos de la serie
        barChartOptions.series[0].data = counts;  // Llenar los datos con las cantidades
        barChartOptions.xaxis.categories = months; // Asegurarse de que los meses estén como categorías

        // Crear y renderizar el gráfico
        if (document.getElementById("bar-chart") && typeof ApexCharts !== 'undefined') {
            const barChart = new ApexCharts(document.getElementById("bar-chart"), barChartOptions);
            barChart.render();
        }
    })
    .catch(error => console.error('Error al obtener los datos:', error));
