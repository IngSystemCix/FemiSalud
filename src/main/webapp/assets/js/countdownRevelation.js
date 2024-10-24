document.addEventListener("DOMContentLoaded", () => {
  let counter = 5;
  const countdown = document.getElementById("countdown");

  const interval = setInterval(() => {
    counter--;
    countdown.textContent = counter;
    if (counter === 0) {
      clearInterval(interval);
      // Redirigir a la página cuando el contador llega a 0
      window.location.href = "/femisalud/revelationBOY.jsp";
    }
  }, 1000);
});