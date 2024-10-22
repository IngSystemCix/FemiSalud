document.addEventListener('DOMContentLoaded', () => {
    const startSelect = document.getElementById('startLetter');
    const endSelect = document.getElementById('endLetter');

    // Función para generar letras de la A a la Z
    const generateAlphabetOptions = (selectElement) => {
        for (let charCode = 65; charCode <= 90; charCode++) { // 65 es el código ASCII de 'A' y 90 de 'Z'
            const option = document.createElement('option');
            option.value = String.fromCharCode(charCode);
            option.textContent = String.fromCharCode(charCode);
            selectElement.appendChild(option);
        }
    };

    // Generar las opciones para ambos selects
    generateAlphabetOptions(startSelect);
    generateAlphabetOptions(endSelect);
});
