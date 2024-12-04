// Selección de los elementos del formulario
const nameInput = document.getElementById('name');
const dniInput = document.getElementById('dni');
const telInput = document.getElementById('tel');
const emailInput = document.getElementById('email');

dniInput.addEventListener('input', function(event) {
    const value = event.target.value;

    event.target.value = value.replace(/[^0-9]/g, '');

    if (event.target.value.length > 8) {
        event.target.value = event.target.value.substring(0, 8);
    }
});

telInput.addEventListener('input', function(event) {
    const value = event.target.value;
    // Reemplazar todo lo que no sea un número
    event.target.value = value.replace(/[^0-9]/g, '');

    if (event.target.value.length > 9) {
        event.target.value = event.target.value.substring(0, 9);
    }
});

emailInput.addEventListener('input', function(event) {
    const value = event.target.value;
    event.target.setCustomValidity('');
    if (!validateEmail(value)) {
        event.target.setCustomValidity('Correo electrónico no válido');
    }
});

function validateEmail(email) {
    const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    return regex.test(email);
}

nameInput.addEventListener('input', function(event) {
    const value = event.target.value;
    // Reemplazar todo lo que no sean letras y espacios
    event.target.value = value.replace(/[^a-zA-ZáéíóúÁÉÍÓÚñÑ\s]/g, '');
});
