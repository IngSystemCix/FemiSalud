// Función para obtener los datos de la API
const fetchUltrasoundStatistics = async () => {
    try {
        const response = await fetch(`${window.location.origin}/femisalud/api/ultrasound-statistics`);
        if (!response.ok) {
            throw new Error(`Error al obtener los datos de la API: ${response.statusText}`);
        }
        const data = await response.json();
        return data;
    } catch (error) {
        console.error("Error al obtener los datos:", error);
        return null;
    }
};

// Función para obtener las opciones del gráfico con datos de la API
const getChartOptions = (statistics) => {
    // Asegurándonos de que los datos estén disponibles
    if (!statistics) {
        return getDefaultChartOptions();
    }

    // Si tenemos datos, actualizamos las series
    return {
        series: [
            statistics.percentageViews,
            statistics.percentageNoViews,
            statistics.percentageDownloads
        ],
        colors: ["#1C64F2", "#16BDCA", "#FDBA8C"],
        chart: {
            height: "380px",
            width: "100%",
            type: "radialBar",
            sparkline: { enabled: true },
        },
        plotOptions: {
            radialBar: {
                track: { background: '#E5E7EB' },
                dataLabels: { show: false },
                hollow: { margin: 0, size: "32%" },
            },
        },
        grid: {
            show: false,
            strokeDashArray: 4,
            padding: { left: 2, right: 2, top: -23, bottom: -20 },
        },
        labels: ["Visualizadas", "No visualizadas", "Descargadas"],
        legend: {
            show: true,
            position: "bottom",
            fontFamily: "Inter, sans-serif",
        },
        tooltip: {
            enabled: true,
            x: { show: false },
        },
        yaxis: {
            show: false,
            labels: {
                formatter: function (value) {
                    return value + '%';
                }
            }
        }
    };
};

// Función para opciones predeterminadas en caso de que no haya datos
const getDefaultChartOptions = () => {
    return {
        series: [0, 0, 0],
        colors: ["#1C64F2", "#16BDCA", "#FDBA8C"],
        chart: {
            height: "380px",
            width: "100%",
            type: "radialBar",
            sparkline: { enabled: true },
        },
        plotOptions: {
            radialBar: {
                track: { background: '#E5E7EB' },
                dataLabels: { show: false },
                hollow: { margin: 0, size: "32%" },
            },
        },
        grid: {
            show: false,
            strokeDashArray: 4,
            padding: { left: 2, right: 2, top: -23, bottom: -20 },
        },
        labels: ["Visualizadas", "No visualizadas", "Descargadas"],
        legend: {
            show: true,
            position: "bottom",
            fontFamily: "Inter, sans-serif",
        },
        tooltip: {
            enabled: true,
            x: { show: false },
        },
        yaxis: {
            show: false,
            labels: {
                formatter: function (value) {
                    return value + '%';
                }
            }
        }
    };
};

// Obtener datos de la API y renderizar el gráfico
fetchUltrasoundStatistics().then((data) => {
    if (data) {
        const chart = new ApexCharts(document.querySelector("#radial-chart"), getChartOptions(data));
        chart.render();
    } else {
        console.log("No se pudieron obtener datos para renderizar el gráfico.");
    }
});
