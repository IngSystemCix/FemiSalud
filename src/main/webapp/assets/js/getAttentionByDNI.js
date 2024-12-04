function fetchAttentionDates() {
    const dni = document.getElementById('dni').value;
    const dateAttentionSelect = document.getElementById('dateAttention');

    // Limpia las opciones actuales
    dateAttentionSelect.innerHTML = '<option disabled selected>Cargando fechas...</option>';

    // Realiza la solicitud al servidor
    fetch(`${window.location.origin}/femisalud/get-attention-dates?dni=${dni}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al obtener las fechas de atención');
            }
            return response.json(); // Se espera que la respuesta sea un array de fechas
        })
        .then(data => {
            // Vaciar el select antes de agregar nuevas opciones
            dateAttentionSelect.innerHTML = '<option disabled selected>Selecciona una fecha</option>';

            // Agregar opciones al select
            data.forEach(date => {
                const option = document.createElement('option');
                option.value = date;  // Aquí debes asegurarte de que 'date' esté en el formato adecuado
                option.textContent = date;  // Si 'date' es una cadena o una fecha formateada
                dateAttentionSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error:', error);
            dateAttentionSelect.innerHTML = '<option disabled selected>Error al cargar fechas</option>';
        });
}
