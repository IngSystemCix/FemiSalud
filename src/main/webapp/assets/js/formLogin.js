const form = document.querySelector('form');
const containerCode = document.querySelector("#container_code");
const getCodeButton = document.querySelector("#get_code");
let context = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

form.addEventListener('submit', async (event) => {
    event.preventDefault(); // Evita la acción de envío por defecto

    const dni = form.elements['dni'].value; // Obtén el valor del campo dni

    try {
        const response = await fetch('/femisalud/send_code', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({ dni: dni }),
        });

        if (response.ok) {
            containerCode.classList.remove("hidden");
            getCodeButton.removeAttribute("id");
            getCodeButton.value = "Iniciar Sesión";
            form.action = window.location.protocol+"//"+ window.location.host + context + "/validate_code";
            console.log("Correo enviado correctamente");
        } else {
            console.error("Error al enviar el correo");
        }
    } catch (error) {
        console.error("Error en la solicitud:", error);
    }
});
