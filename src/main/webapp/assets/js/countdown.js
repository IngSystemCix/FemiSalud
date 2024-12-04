// script.js

// Referencias
const countdownElement = document.getElementById("countdown");
const canvas = document.getElementById("confetti");
const ctx = canvas.getContext("2d");
const audioElement = document.getElementById('aud-fest');

// Ajusta el tamaño del lienzo
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let countdown = 5; // Tiempo inicial en segundos
let confettiPieces = [];
let isConfettiActive = false;

// Genera piezas de confeti
function generateConfetti() {
    confettiPieces = [];
    for (let i = 0; i < 150; i++) {
        confettiPieces.push({
            x: Math.random() * canvas.width,
            y: Math.random() * canvas.height,
            size: Math.random() * 10 + 5,
            color: `hsl(${Math.random() * 360}, 100%, 50%)`,
            speedX: Math.random() * 3 - 1.5,
            speedY: Math.random() * 3 + 1,
            rotation: Math.random() * 360,
            rotationSpeed: Math.random() * 10 - 5,
        });
    }
}

// Dibuja el confeti
function drawConfetti() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    confettiPieces.forEach((piece) => {
        ctx.save();
        ctx.translate(piece.x, piece.y);
        ctx.rotate((piece.rotation * Math.PI) / 180);
        ctx.fillStyle = piece.color;
        ctx.fillRect(-piece.size / 2, -piece.size / 2, piece.size, piece.size);
        ctx.restore();

        piece.x += piece.speedX;
        piece.y += piece.speedY;
        piece.rotation += piece.rotationSpeed;

        if (piece.y > canvas.height) piece.y = -piece.size;
        if (piece.x > canvas.width) piece.x = -piece.size;
        if (piece.x < -piece.size) piece.x = canvas.width + piece.size;
    });

    if (isConfettiActive) {
        requestAnimationFrame(drawConfetti);
    }
}

// Inicia la cuenta regresiva
const timer = setInterval(() => {
    countdown--;
    countdownElement.textContent = countdown;

    if (countdown <= 0) {
        clearInterval(timer);
        countdownElement.textContent = "¡Tiempo terminado!";
        startConfetti();
    }
}, 1000);

// Inicia el confeti por 3 segundos
function startConfetti() {
    generateConfetti();
    isConfettiActive = true;
    drawConfetti();

    setTimeout(() => {
        isConfettiActive = false;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
    }, 10000);
}

// Ajusta el lienzo al redimensionar
window.addEventListener("resize", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
});
