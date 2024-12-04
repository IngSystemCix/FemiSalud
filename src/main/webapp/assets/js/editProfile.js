const editarBtn = document.querySelector('#edit');
const inputs = document.querySelectorAll('input');
const guardarBtn = document.querySelector('#save');

let isEditing = false;

editarBtn.addEventListener('click', function() {
    if (isEditing) {
        inputs.forEach(input => {
            input.setAttribute('readonly', true);
        });
        editarBtn.textContent = 'Editar perfil';
        guardarBtn.style.backgroundColor = '#4b5563';
        guardarBtn.disabled = true;
    } else {
        inputs.forEach(input => {
            input.removeAttribute('readonly');
        });
        editarBtn.textContent = 'Cancelar edición';
        guardarBtn.style.backgroundColor = '#115691';
        guardarBtn.disabled = false;
    }

    // Alternamos el estado de edición
    isEditing = !isEditing;
});
