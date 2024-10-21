// Obtener el contenedor de formularios
const formContainer = document.getElementById('form-container');

// Contador para llevar el número de formularios creados
let formCount = 1;

// Función para crear un nuevo formulario
function createNewForm() {
    formCount++;

    const newForm = document.createElement('div');
    newForm.classList.add('max-w-md', 'mx-auto');
    newForm.innerHTML = `
        <div class="max-w-md mx-auto">
        <form class="w-96 bg-femisalud-300 border border-gray-300 text-gray-900 text-sm pt-12 pb-10 px-10 shadow-lg dark:bg-femisalud-600 dark:border-gray-600 dark:text-white rounded-b-lg rounded-t-[800px]">
            <h2 class="text-center font-bold text-3xl mb-5 text-femisalud-600 dark:text-femisalud-100">Invitada ${formCount}</h2>

            <div class="mb-6">
                <label for="input_full_name_${formCount}" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nombre Completo</label>
                <input type="text" id="input_full_name_${formCount}" class="bg-femisalud-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            </div>

            <div class="mb-6">
                <label for="input_dni_${formCount}" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">DNI</label>
                <input type="text" id="input_dni_${formCount}" class="bg-femisalud-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            </div>

            <div class="mb-6">
                <label for="input_telefono_${formCount}" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Teléfono</label>
                <input type="text" id="input_telefono_${formCount}" class="bg-femisalud-100 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            </div>

            <div class="mb-6">
                <label for="input_email_${formCount}" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Correo eléctronico</label>
                <input type="text" id="input_email_${formCount}" class="bg-femisalud-100 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            </div>
        </form>
        </div>
    `;

    // Añadir el nuevo formulario al contenedor
    formContainer.appendChild(newForm);

    // Agregar el evento para detectar cuando se complete el último input del nuevo formulario
    const lastInput = newForm.querySelector(`#input_email_${formCount}`);
    lastInput.addEventListener('input', handleLastInput);
}

// Función que se ejecuta al completar el último input
function handleLastInput(event) {
    const input = event.target;
    if (input.value.trim() !== '') {
        // Remover el event listener para evitar múltiples ejecuciones
        input.removeEventListener('input', handleLastInput);
        // Crear un nuevo formulario
        createNewForm();
    }
}

// Obtener el último input del primer formulario y agregarle el evento
const initialLastInput = document.querySelector('#input_email');
initialLastInput.addEventListener('input', handleLastInput);
