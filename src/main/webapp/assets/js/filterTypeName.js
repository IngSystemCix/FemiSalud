document.addEventListener("DOMContentLoaded", () => {
    const apiUrl = "https://ingsystemcix.github.io/APIs/names_type.json"; // URL de la API
    const tableBody = document.getElementById("name-table-body");
    let allData = []; // Variable para almacenar todos los datos de la API

    // Función para obtener y filtrar datos por tipo
    const fetchDataByType = async (type) => {
        try {
            const response = await fetch(apiUrl);
            if (!response.ok) throw new Error(`Error HTTP: ${response.status}`);
            const data = await response.json();

            if (data[type]) {
                updateTable(data[type]);
            } else {
                alert(`No se encontraron nombres para la categoría "${type}"`);
            }
        } catch (error) {
            console.error("Error al obtener los datos:", error);
        }
    };

    // Función para cargar todos los datos y mantenerlos en memoria
    const fetchAllData = async () => {
        try {
            const response = await fetch(apiUrl);
            if (!response.ok) throw new Error(`Error HTTP: ${response.status}`);
            const data = await response.json();
            allData = Object.values(data).flat(); // Combina todas las categorías en un solo arreglo
            updateTable(allData); // Carga todos los datos inicialmente
        } catch (error) {
            console.error("Error al obtener todos los datos:", error);
        }
    };

    // Función para actualizar la tabla
    const updateTable = (names) => {
        tableBody.innerHTML = ""; // Limpia las filas existentes
        names.forEach((name) => {
            const row = document.createElement("tr");
            row.classList.add("border-b", "hover:bg-gray-100");

            // Crea la celda del ícono SVG
            const svgCell = document.createElement("td");
            svgCell.classList.add("px-6", "py-4", "text-center");
            const svg = `
            <svg 
                id="favorite-icon-${name.name}"
                xmlns="http://www.w3.org/2000/svg" 
                viewBox="0 0 426.667 426.667" 
                class="w-6 h-6 fill-current hover:text-yellow-500 text-gray-700 cursor-pointer" 
                data-favorite="false">  <!-- Atributo data-favorite -->
                <polygon 
                    points="213.333,10.441 279.249,144.017 426.667,165.436 320,269.41 345.173,416.226 213.333,346.91 81.485,416.226 106.667,269.41 0,165.436 147.409,144.017" 
                    class="stroke-current stroke-[2px] hover:stroke-yellow-500">
                </polygon>
            </svg>
        `;
            svgCell.innerHTML = svg;
            row.appendChild(svgCell);

            // Crea la celda de imagen basada en el género
            const imgCell = document.createElement("td");
            imgCell.classList.add("px-6", "py-4");
            const img = document.createElement("img");
            img.src = `${window.location.origin}/femisalud/assets/img/${name.genre === "hombre" ? "male.png" : "female.png"}`;
            img.alt = name.genre === "hombre" ? "Hombre" : "Mujer";
            img.style.width = "32px";
            img.style.height = "32px";
            imgCell.appendChild(img);
            row.appendChild(imgCell);

            // Crea la celda del nombre
            const nameCell = document.createElement("td");
            nameCell.classList.add("px-6", "py-4");
            nameCell.textContent = name.name;
            row.appendChild(nameCell);

            // Verifica si el nombre es favorito y cambia el color del SVG
            checkIfFavorite(name.name).then((isFavorite) => {
                const svgIcon = document.getElementById(`favorite-icon-${name.name}`);
                if (isFavorite) {
                    svgIcon.style.fill = "#eab308"; // Cambia el color del ícono si es favorito
                    svgIcon.setAttribute('data-favorite', 'true');
                } else {
                    svgIcon.style.fill = "currentColor"; // Color original (gris)
                    svgIcon.setAttribute('data-favorite', 'false');
                }
            });

            // Agrega la fila a la tabla
            tableBody.appendChild(row);
        });
    };

    // Función para verificar si el nombre es favorito
    async function checkIfFavorite(name) {
        try {
            const response = await fetch(`${window.location.origin}/femisalud/api/get-is-favorite-name-baby?name=${encodeURIComponent(name)}`, {
                method: 'GET',
            });

            if (!response.ok) {
                throw new Error(`Error HTTP: ${response.status}`);
            }

            const data = await response.json();

            return data.isFavorite; // Retorna si es favorito o no
        } catch (error) {
            console.error('Error al verificar si el nombre es favorito:', error);
            return false;
        }
    }

    // Función para filtrar por género en la tabla actual
    const filterByGender = (gender) => {
        const rows = Array.from(tableBody.rows);
        rows.forEach((row) => {
            const imgCell = row.cells[1]; // La celda de imagen
            const img = imgCell.querySelector("img");
            const isVisible = gender === "todos" || img.alt.toLowerCase() === gender;
            row.style.display = isVisible ? "" : "none";
        });
    };

    // Función para filtrar los nombres por letra inicial
    const filterByStartLetter = (startLetter) => {
        return allData.filter((name) => name.name.toLowerCase().startsWith(startLetter.toLowerCase()));
    };

    // Función para filtrar los nombres por letra final
    const filterByEndLetter = (endLetter) => {
        return allData.filter((name) => name.name.toLowerCase().endsWith(endLetter.toLowerCase()));
    };

    // Función principal para filtrar los nombres por letra inicial y/o final
    const filterByLetters = () => {
        const startLetter = document.getElementById("start_letter").value;
        const endLetter = document.getElementById("end_letter").value;

        let filteredNames = allData;

        // Filtra por letra de inicio si está presente
        if (startLetter) {
            filteredNames = filterByStartLetter(startLetter);
        }

        // Filtra por letra de fin si está presente
        if (endLetter) {
            filteredNames = filterByEndLetter(endLetter);
        }

        // Actualiza la tabla con los resultados filtrados
        updateTable(filteredNames);
    };

    // Función para llenar los selectores con letras del alfabeto
    const populateSelect = (selectId) => {
        const selectElement = document.getElementById(selectId);
        for (let charCode = 65; charCode <= 90; charCode++) { // Código ASCII de 'A' a 'Z'
            const letter = String.fromCharCode(charCode);
            const option = document.createElement("option");
            option.value = letter;
            option.textContent = letter;
            selectElement.appendChild(option);
        }
    };

    // Conecta los botones al evento de filtrado por tipo
    document.querySelectorAll("[id^='filter-']").forEach((button) => {
        button.addEventListener("click", () => {
            const type = button.getAttribute("data-type");
            fetchDataByType(type);
        });
    });

    // Conecta el botón de "Todos los nombres" al evento
    document.getElementById("loadAllNames").addEventListener("click", fetchAllData);

    // Conecta los botones "Niña" y "Niño" al filtro por género
    document.getElementById("filterGirls").addEventListener("click", () => {
        filterByGender("mujer");
    });
    document.getElementById("filterBoys").addEventListener("click", () => {
        filterByGender("hombre");
    });

    // Inicializa los eventos de cambio para los selectores de letras
    document.getElementById("start_letter").addEventListener("change", () => {
        filterByLetters(); // Aplica el filtro cada vez que cambia el valor
        document.getElementById("end_letter").selectedIndex = 0; // Reset el otro selector
    });

    document.getElementById("end_letter").addEventListener("change", () => {
        filterByLetters(); // Aplica el filtro cada vez que cambia el valor
        document.getElementById("start_letter").selectedIndex = 0; // Reset el otro selector
    });

    // Llenar los selectores con letras del alfabeto
    populateSelect("start_letter");
    populateSelect("end_letter");

    // Función para registrar un nombre como favorito
    const registerFavoriteName = async (name) => {
        try {
            const response = await fetch(`${window.location.origin}/femisalud/api/register-favorites-names-baby`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ name: name }),
            });

            if (!response.ok) {
                throw new Error("Error al registrar el nombre como favorito.");
            }

            const data = await response.json();
            if (data.success) {
                console.log("Nombre registrado como favorito");
            } else {
                alert("Error al registrar el nombre.");
            }
        } catch (error) {
            console.error("Error al registrar el nombre:", error);
        }
    };

    const deleteFavoriteName = async (name) => {
        try {
            const response = await fetch(`${window.location.origin}/femisalud/api/delete-favorites-names-baby`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ name: name }),
            });

            console.log("Nombre usado: " + name);
            console.log("Estado de la respuesta: ", response.status);  // Verifica el código de estado

            if (!response.ok) {
                throw new Error(`Error al eliminar el nombre de favoritos. Estado: ${response.status}`);
            }

            const data = await response.json();
            if (data.success) {
                console.log("Nombre eliminado de favoritos");
            } else {
                alert("Error al eliminar el nombre.");
            }
        } catch (error) {
            console.error("Error al eliminar el nombre:", error);
        }
    };

    // Manejo del clic en el ícono para registrar/eliminar favoritos
    tableBody.addEventListener("click", (event) => {
        if (event.target.closest("svg")) {
            const svg = event.target.closest("svg");
            const name = svg.closest("tr").querySelector("td:nth-child(3)").textContent;

            const isFavorite = svg.getAttribute('data-favorite') === 'true'; // Usar el atributo 'data-favorite'

            if (isFavorite) {
                deleteFavoriteName(name).then(() => {
                    svg.style.fill = "currentColor"; // Cambia el color a gris o color original
                    svg.setAttribute('data-favorite', 'false'); // Actualiza el atributo 'data-favorite'
                });
            } else {
                registerFavoriteName(name).then(() => {
                    svg.style.fill = "#eab308"; // Cambia el color a amarillo cuando se marca como favorito
                    svg.setAttribute('data-favorite', 'true'); // Actualiza el atributo 'data-favorite'
                });
            }
        }
    });

    // Función para filtrar los nombres favoritos
    const filterFavorites = async () => {
        // Primero, obtenemos los nombres favoritos de manera asíncrona
        const favoriteNames = await Promise.all(allData.map(async (name) => {
            const isFavorite = await checkIfFavorite(name.name);
            return isFavorite ? name : null;
        }));

        // Filtra las entradas nulas (aquellas que no son favoritas)
        const filteredFavorites = favoriteNames.filter(name => name !== null);

        // Evitar duplicados
        const uniqueFavorites = Array.from(new Set(filteredFavorites.map(name => name.name)))
            .map(name => filteredFavorites.find(nameObj => nameObj.name === name));

        // Actualiza la tabla con los nombres favoritos filtrados y sin duplicados
        updateTable(uniqueFavorites);
    };

    // Conecta el botón de "Favoritos"
    document.getElementById("favoriteNames").addEventListener("click", filterFavorites);

    // Carga todos los datos al inicio
    fetchAllData();
});