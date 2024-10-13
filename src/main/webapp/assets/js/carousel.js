let currentSlide = 0;
const slides = document.querySelector('#slider-content > div');
const totalSlides = slides.children.length;
const dots = document.querySelectorAll('.flex button');


function updateSlider() {
    slides.style.transform = `translateX(-${currentSlide * 731}px)`;

    // Actualizar estado activo de los botones
    dots.forEach((dot, index) => {
        dot.classList.toggle('bg-black', index === currentSlide);
        dot.classList.toggle('bg-gray-400', index !== currentSlide);
    });
}

// Cambiar a un slide específico
function goToSlide(slide) {
    currentSlide = slide;
    updateSlider();
}

// Cambiar al siguiente slide automáticamente
function nextSlide() {
    currentSlide = (currentSlide < totalSlides - 1) ? currentSlide + 1 : 0;
    updateSlider();
}

// Iniciar el auto-slide cada 5 segundos
setInterval(nextSlide, 5000);

// Actualizar inicialmente para que el primer punto esté activo
updateSlider();