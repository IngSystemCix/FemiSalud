document.getElementById('search').addEventListener('click', async () => {
    // Obtén el valor seleccionado del combobox
    const patientDNI = document.getElementById('patient').value;

    if (!patientDNI || patientDNI === "Selecciona una paciente") {
        alert('Por favor, selecciona una paciente.');
        return;
    }

    try {
        // Realiza una solicitud GET al servlet
        const response = await fetch(`${window.location.origin}/femisalud/get-clinical-notes-by-dni?patient=${patientDNI}`);
        if (!response.ok) {
            throw new Error('Error al obtener las notas clínicas.');
        }

        // Convierte la respuesta JSON a un objeto JavaScript
        const clinicalNotes = await response.json();

        // Limpia la tabla antes de llenarla con nuevos datos
        const tableBody = document.getElementById('name-table-body');
        tableBody.innerHTML = '';

        // Itera sobre las notas clínicas y agrégalas a la tabla
        clinicalNotes.forEach(note => {
            const row = `
                <tr>
                    <td class="px-6 py-4">${note.dni}</td>
                    <td class="px-6 py-4">${note.idUltrasound}</td>
                    <td class="px-6 py-4">${note.ultrasoundDate}</td>
                    <td class="px-6 py-4 truncate-text">
                        ${note.clinicalNotes.length > 50 ?
                `${note.clinicalNotes.substring(0, 50)}... <a href="#" class="view-more text-blue-700 hover:text-blue-500" data-note="${note.clinicalNotes}">Ver más</a>` :
                note.clinicalNotes}
                    </td>
                </tr>`;
            tableBody.insertAdjacentHTML('beforeend', row);
        });

        // Reasignar eventos a los enlaces "Ver más" después de actualizar la tabla
        assignViewMoreEvent();
    } catch (error) {
        console.error(error);
        alert('Ocurrió un error al obtener las notas clínicas.');
    }
});

// Función para asignar eventos a los enlaces "Ver más"
function assignViewMoreEvent() {
    const viewMoreLinks = document.querySelectorAll('.view-more');
    viewMoreLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const noteText = e.target.getAttribute('data-note');
            const modalText = document.getElementById('modal-text');
            modalText.textContent = noteText; // Establecer el texto completo en el modal
            document.getElementById('modal').style.display = 'flex'; // Mostrar el modal
        });
    });
}

// Modal functionality
document.addEventListener('DOMContentLoaded', () => {
    // Cerrar modal al hacer clic en la 'X'
    document.querySelector('.close-btn').addEventListener('click', () => {
        document.getElementById('modal').style.display = 'none';
    });

    // Cerrar modal al hacer clic fuera del contenido
    window.addEventListener('click', (e) => {
        if (e.target === document.getElementById('modal')) {
            document.getElementById('modal').style.display = 'none';
        }
    });
});
