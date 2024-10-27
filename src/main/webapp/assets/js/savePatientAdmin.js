function guardarDatos() {
    // Obtener los valores del formulario
    const dni = document.getElementById('dni').value;
    const nombre = document.getElementById('nombre').value;
    const apellidoPaterno = document.getElementById('apellido-paterno').value;
    const apellidoMaterno = document.getElementById('apellido-materno').value;
    const telefono = document.getElementById('telefono').value;
    const email = document.getElementById('email').value;
    const bebeGestion = document.getElementById('bebe-gestion').value;

    // Validar que los campos no estén vacíos
    if (!dni || !nombre || !apellidoPaterno || !apellidoMaterno || !telefono || !email) {
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
                    <td class="py-2 px-4 border-b">${telefono}</td>
                    <td class="py-2 px-4 border-b">${email}</td>
                    <td class="py-2 px-4 border-b">${bebeGestion}</td>
                </tr>
            `;

    // Insertar la nueva fila en la tabla
    document.getElementById('tabla-pacientes').insertAdjacentHTML('beforeend', nuevaFila);

    // Limpiar el formulario después de guardar
    document.getElementById('dni').value = '';
    document.getElementById('nombre').value = '';
    document.getElementById('apellido-paterno').value = '';
    document.getElementById('apellido-materno').value = '';
    document.getElementById('telefono').value = '';
    document.getElementById('email').value = '';
    document.getElementById('bebe-gestion').value = 'UNICO';

    alert('Datos guardados correctamente.');
}