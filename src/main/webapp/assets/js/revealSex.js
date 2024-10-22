document.addEventListener('DOMContentLoaded', () => {
    const revealSexButton = document.getElementById('revealSexButton');
    const yesButton = document.getElementById('yesButton');
    const noButton = document.getElementById('noButton');

    // Configurar el evento para el botón "Sí"
    yesButton.addEventListener('click', () => {
        revealSexButton.disabled = false; // Activa el botón
        revealSexButton.classList.remove('bg-gray-600', 'hover:bg-gray-700'); // Elimina clases gris
        revealSexButton.classList.add('bg-blue-700', 'hover:bg-blue-800'); // Añade clases azul
    });

    // Configurar el evento para el botón "No"
    noButton.addEventListener('click', () => {
        revealSexButton.disabled = true; // Desactiva el botón
        revealSexButton.classList.remove('bg-blue-700', 'hover:bg-blue-800'); // Elimina clases azul
        revealSexButton.classList.add('bg-gray-600', 'hover:bg-gray-700'); // Añade clases gris
    });
});
