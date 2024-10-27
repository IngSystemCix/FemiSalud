function guardarDatos() {
    // Obtener valores del formulario
    const fecha = document.getElementById('fecha').value;
    const evaluacion = document.getElementById('evaluacion').value;
    const tipo = document.getElementById('tipo').value;
    const url = document.getElementById('url').value;
    const dni = document.getElementById('dni').value;

    // Crear una nueva fila para la tabla
    const tabla = document.getElementById('tablaEcografias');
    const fila = document.createElement('tr');
    fila.classList.add('bg-gray-100', 'border-b');

    fila.innerHTML = `
                <td class="py-2 px-4">${fecha}</td>
                <td class="py-2 px-4"><a href="${url}" target="_blank" class="text-blue-500 hover:underline">${url}</a></td>
                <td class="py-2 px-4">${dni}</td>
            `;

    // Agregar la nueva fila a la tabla
    tabla.appendChild(fila);

    // Limpiar formulario
    document.getElementById('ecografiaForm').reset();
}