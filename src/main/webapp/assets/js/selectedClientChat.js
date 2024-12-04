// Seleccionar todos los elementos de chat
const chatItems = document.querySelectorAll('.notification-item');

// Agregar un evento de clic a cada chat
chatItems.forEach(item => {
    item.addEventListener('click', () => {
        // Obtener el nombre del usuario seleccionado
        const userName = item.querySelector('.font-bold').textContent;

        // Mostrar el nombre del usuario seleccionado en la consola
        console.log(`Chat seleccionado: ${userName}`);

        // Alternativamente, muestra el nombre en el encabezado del chat
        const chatHeader = document.querySelector('h2');
        if (chatHeader) {
            chatHeader.textContent = `Chat con ${userName}`;
        }
    });
});