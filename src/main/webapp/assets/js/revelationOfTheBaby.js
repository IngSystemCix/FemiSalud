const revealLink = document.getElementById("revealLink");
const yesButton = document.getElementById("yesButton");
const noButton = document.getElementById("noButton");

// Deshabilitar el enlace inicialmente
revealLink.classList.add("opacity-50", "pointer-events-none");

// Habilitar el enlace cuando se presiona "Sí"
yesButton.addEventListener("click", () => {
    revealLink.classList.remove("opacity-50", "pointer-events-none");
});

// Deshabilitar el enlace cuando se presiona "No"
noButton.addEventListener("click", () => {
    revealLink.classList.add("opacity-50", "pointer-events-none");
});