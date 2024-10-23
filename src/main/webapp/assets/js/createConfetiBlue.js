// Función para generar confeti
function createConfetti2() {
    const confettiContainer = document.getElementById('confetti-container-blue');
    for (let i = 0; i < 100; i++) {
        const confetti = document.createElement('div');
        confetti.classList.add('w-2', 'h-4', 'absolute', 'bg-femisalud-400', 'opacity-75', 'rounded-full', 'animate-confetti-fall');
        confetti.style.left = Math.random() * 100 + 'vw';
        confetti.style.animationDuration = Math.random() * 3 + 2 + 's';
        confetti.style.animationDelay = Math.random() * 2 + 's';
        confettiContainer.appendChild(confetti);
    }
}

window.onload = createConfetti2;