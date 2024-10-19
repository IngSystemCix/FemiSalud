// Función para verificar si todos los campos están completos
function checkAndAddForm() {
    const forms = document.querySelectorAll('.form-invitada');
    let allComplete = true;

    forms.forEach(form => {
        const inputs = form.querySelectorAll('input');
        inputs.forEach(input => {
            if (input.value.trim() === '') {
                allComplete = false;
            }
        });
    });

    if (allComplete) {
        addForm(forms.length + 1);
    }
}

// Función para agregar un nuevo formulario
function addForm(numeroInvitada) {
    const container = document.getElementById('form-container');
    const newForm = `
    <div class="bg-blue-100 rounded-t-full p-9 shadow-lg min-w-[300px]">
      <h2 class="text-center text-lg font-semibold mb-4">Invitada ${numeroInvitada}</h2>
      <label class="block mb-2">Nombre completo:</label>
      <input type="text" class="w-full p-2 mb-4 border border-gray-300 rounded" oninput="checkAndAddForm()">
      <label class="block mb-2">DNI:</label>
      <input type="text" class="w-full p-2 mb-4 border border-gray-300 rounded" oninput="checkAndAddForm()">
      <label class="block mb-2">Teléfono:</label>
      <input type="text" class="w-full p-2 mb-4 border border-gray-300 rounded" oninput="checkAndAddForm()">
      <label class="block mb-2">Correo electrónico:</label>
      <input type="email" class="w-full p-2 mb-4 border border-gray-300 rounded" oninput="checkAndAddForm()">
    </div>
  `;
    container.insertAdjacentHTML('beforeend', newForm);
}

// Agregar tres formularios iniciales al cargar la página
document.addEventListener('DOMContentLoaded', () => {
    for (let i = 1; i <= 3; i++) {
        addForm(i);
    }
});
