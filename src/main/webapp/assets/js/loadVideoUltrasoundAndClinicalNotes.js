document.addEventListener('DOMContentLoaded', function () {
    // Cargar el estado inicial, por ejemplo, la primera ecografía
    loadInitialVideoAndClinicalNote();
});

function loadInitialVideoAndClinicalNote() {
    // Cargar los datos de la primera ecografía disponible
    loadVideoAndClinicalNote(1); // Esto carga la ecografía con ID 1 como inicial
}

function loadVideoAndClinicalNote(id) {
    // Realizar solicitud AJAX al servlet para obtener los datos de todas las ecografías
    fetch(`${window.location.origin}/femisalud/api/ultrasound-and-clinical-notes`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Error en la solicitud');
            }
            return response.json(); // Asumiendo que la respuesta es en formato JSON
        })
        .then(data => {
            if (data && data.length > 0) {
                // Accede a los datos de la ecografía seleccionada
                const ultrasoundData = data[id - 1][0]; // Accede al arreglo correspondiente usando el id (resta 1 ya que los índices empiezan en 0)
                const ultrasoundLink = ultrasoundData.ultrasoundLink; // Enlace del video
                const clinicalNote = ultrasoundData.clinicalNotes; // Nota clínica
                const dateTimeUltrasound = ultrasoundData.dateTime; // Fecha y hora de la ecografía

                // Actualizar la fuente del video
                const videoElement = document.getElementById('player');
                const sourceElement = document.getElementById('video-source');
                const dateTimeVideo = document.getElementById('date-time-ultrasound');
                sourceElement.src = ultrasoundLink;  // Establece el enlace del video
                videoElement.load();  // Recarga el video

                dateTimeVideo.innerHTML = dateTimeUltrasound;  // Establece la fecha y hora de la ecografía

                // Mostrar la nota clínica con truncamiento
                const clinicalNoteContainer = document.getElementById('clinical-note-container');
                const clinicalNotePreview = document.getElementById('clinical-note-preview');

                // Limpia el contenido del contenedor para evitar duplicados
                clearPreviousButtons(clinicalNoteContainer);

                if (clinicalNote && clinicalNote.trim().length > 0) {
                    clinicalNotePreview.textContent = clinicalNote.length > 100
                        ? clinicalNote.slice(0, 100) + "..."
                        : clinicalNote;

                    // Si la nota es mayor a 100 caracteres, agregar botón "Ver más"
                    if (clinicalNote.length > 100) {
                        addShowMoreButton(clinicalNote, clinicalNoteContainer);
                    }
                } else if (clinicalNote === 'NO TIENE NOTA CLÍNICA') {
                    clinicalNoteContainer.classList.add('hidden');
                }

                // Mostrar el contenedor de la nota clínica
                clinicalNoteContainer.classList.remove('hidden');
            } else {
                console.error('No se encontraron datos para la ecografía seleccionada');
            }
        })
        .catch(error => {
            console.error('Error al cargar los datos de la ecografía:', error);
        });
}

function addShowMoreButton(clinicalNote, container) {
    // Crear botón dinámicamente
    const showMoreButton = document.createElement('button');
    showMoreButton.textContent = "Ver más";
    showMoreButton.className = "text-blue-500 underline mt-2";

    // Agregar evento para mostrar el modal
    showMoreButton.addEventListener('click', () => {
        showModal(clinicalNote);
    });

    // Añadir el botón al contenedor
    container.appendChild(showMoreButton);
}

function showModal(fullClinicalNote) {
    const modal = document.getElementById('clinical-note-modal');
    const modalContent = document.getElementById('modal-clinical-note');

    modalContent.textContent = fullClinicalNote;
    modal.classList.remove('hidden');

    // Cerrar el modal al hacer clic en la "X"
    document.getElementById('close-modal').addEventListener('click', () => {
        modal.classList.add('hidden');
    });
}

// Nueva función para limpiar los botones anteriores
function clearPreviousButtons(container) {
    const existingButton = container.querySelector('button');
    if (existingButton) {
        existingButton.remove();
    }
}
