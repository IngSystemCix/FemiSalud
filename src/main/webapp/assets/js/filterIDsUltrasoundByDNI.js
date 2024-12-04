function loadUltrasoundIDs(dni) {
    if (!dni) return;

    // Realiza la solicitud AJAX al servlet
    fetch(`${window.location.origin}/femisalud/get-ultrasound-ids?dni=${dni}`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Error al obtener los IDs de las ecografías");
            }
            return response.json();
        })
        .then(data => {
            const idEcoSelect = document.getElementById('id_eco');

            // Limpia las opciones actuales
            idEcoSelect.innerHTML = '<option disabled selected>Selecciona un ID</option>';

            // Agrega las nuevas opciones
            data.forEach(id => {
                const option = document.createElement('option');
                option.value = id;
                option.textContent = id;
                idEcoSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error(error);
            alert("Ocurrió un error al cargar los IDs de las ecografías.");
        });
}