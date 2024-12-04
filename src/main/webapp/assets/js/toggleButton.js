const filterGirls = document.getElementById('filterGirls');
const filterBoys = document.getElementById('filterBoys');

// Inicializar el botón activo
filterGirls.classList.add('active');

// Alternar entre "filterGirls" y "filterBoys"
filterGirls.addEventListener('click', () => {
    if (!filterGirls.classList.contains('active')) {
        filterGirls.classList.add('active');
        filterBoys.classList.remove('active');
    }
});

filterBoys.addEventListener('click', () => {
    if (!filterBoys.classList.contains('active')) {
        filterBoys.classList.add('active');
        filterGirls.classList.remove('active');
    }
});

const loadAllNames = document.getElementById('loadAllNames');
const favoriteNames = document.getElementById('favoriteNames');

// Inicializar el botón activo
loadAllNames.classList.add('active');

// Alternar entre "loadAllNames" y "favoriteNames"
loadAllNames.addEventListener('click', () => {
    if (!loadAllNames.classList.contains('active')) {
        loadAllNames.classList.add('active');
        favoriteNames.classList.remove('active');
    }
});

favoriteNames.addEventListener('click', () => {
    if (!favoriteNames.classList.contains('active')) {
        favoriteNames.classList.add('active');
        loadAllNames.classList.remove('active');
    }
});
