document.getElementById('patientSelect').addEventListener('change', function() {
    const selectedDNI = this.value; // Captura el DNI seleccionado

    // Realiza la petición al servlet para obtener las notas clínicas
    fetch(`/femisalud/clinical_notes?dni=${encodeURIComponent(selectedDNI)}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok: ' + response.statusText);
            }
            return response.json(); // Suponiendo que el servlet devuelve JSON
        })
        .then(clinicalNotes => {
            // Limpia el cuerpo de la tabla
            const clinicalNotesBody = document.getElementById('clinicalNotesBody');
            clinicalNotesBody.innerHTML = ''; // Limpia los datos anteriores

            // Rellena la tabla con las notas clínicas recibidas
            clinicalNotes.forEach(note => {
                const row = document.createElement('tr');
                row.innerHTML = `
                        <td class="py-2 px-4 border-b">${note[0]}</td> <!-- DNI -->
                        <td class="py-2 px-4 border-b">${note[1]}</td> <!-- ID de ecografía -->
                        <td class="py-2 px-4 border-b">${note[2]}</td> <!-- Fecha y hora -->
                        <td class="py-2 px-4 border-b">${note[3]}</td> <!-- Nota clínica -->
                    `;
                clinicalNotesBody.appendChild(row); // Añade la fila a la tabla
            });
        })
        .catch(error => {
            console.error('Error fetching clinical notes:', error);
        });
});