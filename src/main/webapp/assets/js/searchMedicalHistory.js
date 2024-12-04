document.addEventListener("DOMContentLoaded", () => {
    const searchButton = document.querySelector('#button-search-dni');
    const dniSelect = document.querySelector("#dni");
    const tableBody = document.querySelector("#name-table-body");
    const alertInvalidDni = document.querySelector("#alert-error-invalid-dni");

    searchButton.addEventListener("click", async (event) => {
        event.preventDefault(); // Evita la recarga de la página

        const dni = dniSelect.value;
        if (!dni || dni === "Selecciona un DNI") {
            alertInvalidDni.classList.remove("hidden");
            alertInvalidDni.classList.add("flex");
            setTimeout(() => {
                alertInvalidDni.classList.add("hidden");
                alertInvalidDni.classList.remove("flex");
            }, 3000);
            return;
        }

        try {
            // Realizar la solicitud al servlet
            const response = await fetch(`${window.location.origin}/femisalud/search-medical-history?dni=${dni}`, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                },
            });

            if (!response.ok) {
                throw new Error("Error al obtener los datos del historial médico.");
            }

            const medicalHistory = await response.json(); // Asegúrate de que el servlet retorne un JSON

            // Limpiar la tabla antes de rellenarla
            tableBody.innerHTML = "";

            if (medicalHistory.length === 0) {
                tableBody.innerHTML = `<tr><td colspan="4" class="text-center">No se encontraron registros.</td></tr>`;
                return;
            }

            // Rellenar la tabla con los datos obtenidos
            medicalHistory.forEach((record) => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td class="px-6 py-4">${record.dni}</td>
                    <td class="px-6 py-4">${record.fullName}</td>
                    <td class="px-6 py-4">${record.amountBaby}</td>
                    <td class="px-6 py-4">${record.dateAttention}</td>
                `;
                tableBody.appendChild(row);
            });
        } catch (error) {
            console.error(error);
            alert("Ocurrió un error al buscar el historial médico.");
        }
    });
});
