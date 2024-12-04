function toggleInput() {
    const checkbox = document.getElementById('check5-question4');
    const input = document.getElementById('input-question4');

    // Habilitar o deshabilitar el input basado en el estado del checkbox
    input.disabled = !checkbox.checked;
}