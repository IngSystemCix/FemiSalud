document.getElementById('dni-paciente').addEventListener('input', function() {
    const dni = this.value;

    // Solo procede si se han ingresado 8 dígitos
    if (dni.length === 8) {
        fetch(`/femisalud/getUltrasounds?dni=${dni}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                const select = document.getElementById('id-ecografia');
                select.innerHTML = '<option value="" disabled selected>Selecciona una ecografía</option>';

                data.forEach(id => {
                    const option = document.createElement('option');
                    option.value = id;
                    option.textContent = `Ecografía ${id}`;
                    select.appendChild(option);
                });
            })
            .catch(error => {
                console.error('Error al obtener los datos de ecografías:', error);
            });
    }
});
