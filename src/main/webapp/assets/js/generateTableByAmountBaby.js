const babyTableContainer = document.getElementById('baby_table_container');
// Actualizamos las opciones para incluir tanto la etiqueta como el valor correspondiente
const genderOptions = [
    { label: "Mujer", value: "1" },
    { label: "Hombre", value: "0" }
];

document.getElementById('amount_baby').addEventListener('input', function () {
    const amount = parseInt(this.value, 10);

    // Limpiar la tabla previa
    babyTableContainer.innerHTML = '';

    if (!isNaN(amount) && amount > 0 && amount <= 6) {
        // Crear la tabla
        const table = document.createElement('table');
        table.className = 'table-auto border-collapse border border-femisalud-900 w-full text-center';

        // Crear el encabezado
        const thead = document.createElement('thead');
        thead.innerHTML = `
                <tr class="bg-femisalud-300">
                    <th class="border border-femisalud-900 px-4 py-2">N°</th>
                    <th class="border border-femisalud-900 px-4 py-2">Género</th>
                </tr>
            `;
        table.appendChild(thead);

        // Crear el cuerpo de la tabla
        const tbody = document.createElement('tbody');
        for (let i = 1; i <= amount; i++) {
            const row = document.createElement('tr');
            row.innerHTML = `
                    <td class="border border-femisalud-900 px-4 py-2">Hijo ${i}</td>
                    <td class="border border-femisalud-900 px-4 py-2">
                        <select name="baby_genre_${i-1}" class="rounded-lg w-full border border-femisalud-900" required>
                            ${genderOptions
                .map(
                    option =>
                        `<option value="${option.value}">${option.label}</option>`
                )
                .join('')}
                        </select>
                    </td>
                `;
            tbody.appendChild(row);
        }
        table.appendChild(tbody);

        // Agregar la tabla al contenedor
        babyTableContainer.appendChild(table);
    } else if (amount > 6) {
        alert('Por favor, ingrese un valor entre 1 y 6.');
    }
});
