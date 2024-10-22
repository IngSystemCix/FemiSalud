// Selección de estrellas
document.querySelectorAll('.stars').forEach(starContainer => {
    starContainer.addEventListener('click', function(e) {
        if (e.target.classList.contains('star')) {
            const stars = this.querySelectorAll('.star');
            const rating = e.target.getAttribute('data-value');

            // Pinta todas las estrellas hasta la seleccionada
            stars.forEach((star, index) => {
                if (index < rating) {
                    star.classList.remove('text-gray-300');
                    star.classList.add('text-yellow-400');
                } else {
                    star.classList.remove('text-yellow-400');
                    star.classList.add('text-gray-300');
                }
            });

            // Actualiza el valor del input oculto
            const input = this.querySelector('input[type="hidden"]');
            input.value = rating;
        }
    });
});