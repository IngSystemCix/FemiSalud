const form = document.querySelector('form');
const containerCode = document.querySelector("#container_code");
const getCodeButton = document.querySelector("#get_code");

// Variable para controlar si el código ya ha sido enviado
let codeSent = false;

form.addEventListener('submit', async (event) => {
    event.preventDefault(); // Evita la acción de envío por defecto

    // Si el código ya ha sido enviado, no hacer nada
    if (codeSent) {
        return;
    }

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
            getCodeButton.value = "Iniciar Sesión"; // Cambiar el valor del botón
            form.action = "/femisalud/validate_code"; // Cambiar la acción del formulario
            codeSent = true; // Cambiar el estado a enviado
            console.log("Correo enviado correctamente");
        } else {
            console.error("Error al enviar el correo");
        }
    } catch (error) {
        console.error("Error en la solicitud:", error);
    }
});

// Agregar un evento click al botón para enviar el formulario a la nueva acción
getCodeButton.addEventListener('click', (event) => {
    if (codeSent) {
        // Si el código fue enviado, se envía el formulario a la nueva acción
        form.submit(); // Enviar el formulario
    }
});
