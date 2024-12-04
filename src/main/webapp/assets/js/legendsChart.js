document.addEventListener("DOMContentLoaded", () => {
    // Fetch data from the API and update the chart
    fetch(`${window.location.origin}/femisalud/api/get-consults-by-patient`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Error fetching data: ${response.statusText}`);
            }
            return response.json();
        })
        .then(data => {
            // Aplanar el arreglo de arreglos de la API
            const flattenedData = data.flat();

            // Parse the API response
            const categories = [];
            const attendedData = [];
            const notAttendedData = [];

            flattenedData.forEach(consult => {
                if (!categories.includes(consult.dni)) {
                    categories.push(consult.dni); // Add DNI once per patient
                }
                if (consult.status === 'Atendido') {
                    attendedData.push(consult.totalMessagesAttended);
                } else if (consult.status === 'No Atendido') {
                    notAttendedData.push(consult.totalMessagesAttended);
                }
            });

            // Ensure both data arrays match the length of categories
            while (attendedData.length < categories.length) {
                attendedData.push(0);
            }
            while (notAttendedData.length < categories.length) {
                notAttendedData.push(0);
            }

            // Update the chart configuration
            const legendsChart = {
                series: [
                    {
                        name: "Atendidas",
                        data: attendedData,
                        color: "#1A56DB",
                    },
                    {
                        name: "No atendidas",
                        data: notAttendedData,
                        color: "#7E3BF2",
                    },
                ],
                chart: {
                    height: "100%",
                    maxWidth: "100%",
                    type: "area",
                    fontFamily: "Inter, sans-serif",
                    dropShadow: {
                        enabled: false,
                    },
                    toolbar: {
                        show: false,
                    },
                },
                tooltip: {
                    enabled: true,
                    x: {
                        show: false,
                    },
                },
                legend: {
                    show: true
                },
                fill: {
                    type: "gradient",
                    gradient: {
                        opacityFrom: 0.55,
                        opacityTo: 0,
                        shade: "#1C64F2",
                        gradientToColors: ["#1C64F2"],
                    },
                },
                dataLabels: {
                    enabled: false,
                },
                stroke: {
                    width: 6,
                },
                grid: {
                    show: false,
                    strokeDashArray: 4,
                    padding: {
                        left: 2,
                        right: 2,
                        top: -26
                    },
                },
                xaxis: {
                    categories: categories,
                    labels: {
                        show: false,
                    },
                    axisBorder: {
                        show: false,
                    },
                    axisTicks: {
                        show: false,
                    },
                },
                yaxis: {
                    show: false,
                    labels: {
                        formatter: function (value) {
                            return value;
                        }
                    }
                },
            };

            // Render the chart
            if (document.getElementById("legend-chart") && typeof ApexCharts !== 'undefined') {
                const chart = new ApexCharts(document.getElementById("legend-chart"), legendsChart);
                chart.render();
            }
        })
        .catch(error => {
            console.error('Error loading chart data:', error);
        });
});
