function toggleEdit() {
    const telefonoInput = document.getElementById('telefono');
    const emailInput = document.getElementById('email');
    const saveButton = document.getElementById('saveButton');

    // Habilitar los inputs
    telefonoInput.disabled = false;
    emailInput.disabled = false;

    // Cambiar el estado del botón "Guardar datos"
    saveButton.disabled = false;
    saveButton.classList.remove('bg-gray-300', 'text-gray-600', 'cursor-not-allowed');
    saveButton.classList.add('bg-green-600', 'hover:bg-green-700', 'text-white');
}