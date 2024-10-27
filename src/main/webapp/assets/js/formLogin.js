// use this simple function to automatically focus on the next input
function focusNextInput(el, prevId, nextId) {
    if (el.value.length === 0) {
        if (prevId) {
            document.getElementById(prevId).focus();
        }
    } else {
        if (nextId) {
            document.getElementById(nextId).focus();
        }
    }
}

document.querySelectorAll('[data-focus-input-init]').forEach(function(element) {
    element.addEventListener('keyup', function() {
        const prevId = this.getAttribute('data-focus-input-prev');
        const nextId = this.getAttribute('data-focus-input-next');
        focusNextInput(this, prevId, nextId);
    });
});

// Obtenemos los elementos necesarios
const buttonGetCode = document.getElementById('button-get_code');
const buttonReturn = document.getElementById('button-return');
const sectionCode = document.getElementById('secction_code');
const form = document.getElementById('loginForm');

// Al hacer clic en "Obtener código", mostramos la sección de código y el botón "Regresar"
buttonGetCode.addEventListener('click', (event) => {
    event.preventDefault();  // Evitar el envío del formulario inmediato
    sectionCode.classList.remove('hidden');  // Mostramos la sección de código
    buttonReturn.classList.remove('hidden');  // Mostramos el botón "Regresar"

    // Cambiar el tipo del botón para que se envíe el formulario
    buttonGetCode.textContent = 'Iniciar Sesión';  // Cambiamos el texto del botón
    buttonGetCode.id = 'button_login';  // Cambiamos el id del botón

    // Esperar a que se complete la introducción del código antes de enviar
    buttonGetCode.onclick = function() {
        form.submit();  // Enviar el formulario
    };
});

// Al hacer clic en "Regresar", ocultamos la sección de código y volvemos a dejar el botón como estaba
buttonReturn.addEventListener('click', () => {
    sectionCode.classList.add('hidden');  // Ocultamos la sección de código
    buttonReturn.classList.add('hidden');  // Ocultamos el botón "Regresar"

    // Revertimos los cambios al botón, vuelve a ser "Obtener código"
    buttonGetCode.textContent = 'Obtener código';  // Cambiamos el texto de nuevo
    buttonGetCode.id = 'button_get_code';  // Restaurar el id original
});
