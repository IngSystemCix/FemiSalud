const getChartOptions = () => {
    return {
        series: [90, 85, 70],
        colors: ["#e6e6fa", "#ddedfc", "#115691"],
        chart: {
            height: "400px", // Ajustamos la altura para más espacio
            width: "100%",
            type: "radialBar",
            sparkline: {
                enabled: true,
            },
        },
        plotOptions: {
            radialBar: {
                track: {
                    background: '#E5E7EB',
                },
                dataLabels: {
                    show: false,
                },
                hollow: {
                    margin: 0,
                    size: "32%",
                }
            },
        },
        grid: {
            show: false,
            strokeDashArray: 4,
            padding: {
                left: 2,
                right: 2,
                top: -23,
                bottom: -20,
            },
        },
        labels: ["Visualizadas", "No Visualizadas", "Descargadas"],
        legend: {
            show: true,
            position: "bottom",
            horizontalAlign: "center", // Alineación horizontal de la leyenda
            fontFamily: "Inter, sans-serif",
            fontSize: "14px", // Tamaño de fuente ajustado
            itemMargin: {
                horizontal: 10,
                vertical: 5 // Espacio entre items de leyenda para mayor visibilidad
            },
            markers: {
                width: 10,
                height: 10,
                radius: 12
            }
        },
        tooltip: {
            enabled: true,
            x: {
                show: false,
            },
        },
        yaxis: {
            show: false,
            labels: {
                formatter: function (value) {
                    return value + '%';
                }
            }
        }
    }
}

if (document.getElementById("radial-chart") && typeof ApexCharts !== 'undefined') {
    const chart = new ApexCharts(document.querySelector("#radial-chart"), getChartOptions());
    chart.render();
}
