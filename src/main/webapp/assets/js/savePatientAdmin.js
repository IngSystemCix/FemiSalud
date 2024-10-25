function guardarDatos() {
    // Obtener los valores del formulario
    const dni = document.getElementById('dni').value;
    const nombre = document.getElementById('nombre').value;
    const apellidoPaterno = document.getElementById('apellido-paterno').value;
    const apellidoMaterno = document.getElementById('apellido-materno').value;
    const email = document.getElementById('email').value;

    // Validar que los campos no estén vacíos
    if (!dni || !nombre || !apellidoPaterno || !apellidoMaterno || !email) {
        alert('Por favor, completa todos los campos.');
        return;
    }

    // Crear una nueva fila para la tabla
    const nuevaFila = `
                <tr class="bg-blue-50">
                    <td class="py-2 px-4 border-b">${dni}</td>
                    <td class="py-2 px-4 border-b">${nombre}</td>
                    <td class="py-2 px-4 border-b">${apellidoPaterno}</td>
                    <td class="py-2 px-4 border-b">${apellidoMaterno}</td>
                    <td class="py-2 px-4 border-b">${email}</td> <!-- Agregar correo a la fila -->
                </tr>
            `;

    // Insertar la nueva fila en la tabla
    document.getElementById('tabla-pacientes').insertAdjacentHTML('beforeend', nuevaFila);

    // Limpiar el formulario después de guardar
    document.getElementById('dni').value = '';
    document.getElementById('nombre').value = '';
    document.getElementById('apellido-paterno').value = '';
    document.getElementById('apellido-materno').value = '';
    document.getElementById('email').value = '';
    document.getElementById('fecha-nacimiento').value = '';
}