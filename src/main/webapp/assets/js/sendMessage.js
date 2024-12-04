// Inicializar la variable para verificar el primer mensaje
let isFirstMessage = true;

document.getElementById('sendMessageBtn').addEventListener('click', function() {
    let messageInput = document.getElementById('messageInput');
    let messagesContainer = document.getElementById('messages');

    // Verificar si hay un mensaje en el input
    if (messageInput.value.trim() !== "") {
        // Crear el mensaje del usuario
        let newMessage = document.createElement('div');
        newMessage.classList.add('flex', 'items-start', 'space-x-4', 'justify-end');

        let messageContent = document.createElement('div');
        messageContent.classList.add('bg-femisalud-900', 'text-white', 'p-4', 'rounded-xl', 'max-w-[80%]', 'shadow-md', 'transform', 'hover:scale-105', 'transition-all', 'duration-300');
        messageContent.innerHTML = `<p>${messageInput.value}</p>`;

        // Crear un contenedor para la hora
        let messageTime = document.createElement('div');
        messageTime.classList.add('text-sm', 'text-gray-400', 'mt-1');
        let currentTime = new Date();
        let hours = currentTime.getHours().toString().padStart(2, '0');
        let minutes = currentTime.getMinutes().toString().padStart(2, '0');
        messageTime.innerHTML = `${hours}:${minutes}`;

        // Añadir el contenido del mensaje y la hora al contenedor
        newMessage.appendChild(messageContent);
        newMessage.appendChild(messageTime);

        // Agregar el nuevo mensaje al final (debajo del último mensaje)
        messagesContainer.appendChild(newMessage);

        messageInput.value = '';  // Limpiar el input
        messageInput.focus();  // Volver el foco al input

        messagesContainer.scrollTop = messagesContainer.scrollHeight; // Hacer scroll hasta el último mensaje

        // Mostrar las preguntas frecuentes si es el primer mensaje
        if (isFirstMessage) {
            let faqMessage = document.createElement('div');
            faqMessage.classList.add('flex', 'items-start', 'space-x-4', 'justify-start'); // Alineación a la izquierda

            let faqContent = document.createElement('div');
            faqContent.classList.add('bg-femisalud-900', 'text-white', 'p-4', 'rounded-xl', 'sm:max-w-[60%]', 'md:max-w-[40%]', 'shadow-md');
            faqContent.innerHTML = `
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Cuál es el precio de la consulta?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">👉 El precio de nuestra consulta es de S/.120.00 👩‍⚕👨‍⚕</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Necesito una cita para la consulta?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg ">✅ Puedes visitarnos SIN NECESIDAD DE CITAS, te atendemos por orden de llegada. ✅</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg  font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Cuáles son los horarios de atención?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">⏰ Nuestros horarios de atención son:<br>Lunes a sábados de 8:00 a.m. hasta la 1:00 p.m. y de 3:00 p.m. hasta las 7:00 p.m.</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Dónde están ubicados?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">🏥 Nos ubicamos en: Calle 7 de Enero 462 - Chiclayo.</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Cuál es el precio de la ecografía morfológica?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">
                        Los precios de nuestra ecografía morfológica son:<br>
                        👉 Ecografía morfológica en 2D: S/.160.00<br>
                        👉 Ecografía morfológica en 4D: S/.200.00<br>
                        👉 Ecografía morfológica en 5D: S/.220.00<br>
                        👉 Ecografía morfológica en 6D: S/.250.00 (En esta ecografía como regalo te brindamos un hermoso marco decorativo)
                    </p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Cuándo se realiza la ecografía morfológica?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">✅ Esta ecografía se realiza en la semana 20 - 24 de gestación.</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Qué incluye la ecografía morfológica?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">
                        ✅ Evaluación detallada de la estructura del bebé.<br>
                        ✅ Visualización de malformaciones y gesticulaciones.<br>
                        ☺️ Ubicación de la placenta.<br>
                        😌 Cantidad de líquido amniótico.<br>
                        👶🏻 Peso del bebé.<br>
                        ✅ Edad gestacional.<br>
                        ✅ Informe detallado.<br>
                        Sexo del bebé.<br>
                        😌 Fotos de la ecografía en 2D a blanco y negro. Si la ecografía es en 4D, 5D o 6D, las fotos son a color.<br>
                        ☺️💙 Grabación de la ecografía en 4D, 5D y 6D.
                    </p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Puedo obtener la grabación de la ecografía 2D?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">Si deseas la grabación de la ecografía 2D Morfológica, puedes cancelar un adicional de S/.10.00. Esto es OPCIONAL 👶✅</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Debo pagar por cada bebé en un embarazo múltiple?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">RECUERDA: Si tu embarazo es múltiple (más de un bebé), deberás cancelar por bebé, ya que se le hace una evaluación detallada a cada uno y se te brindarán informes por separado 👶✅</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Cuál es el precio de la ecografía genética?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">👉 El precio de nuestra ecografía genética es de S/.160.00 🤰</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Cuándo se realiza la ecografía genética?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">✅ Esta ecografía se realiza entre la semana 11 y las 13 semanas y 6 días de gestación.</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Qué incluye la ecografía genética?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">
                        ✅ Conocer riesgo de Preeclampsia.<br>
                        👶✅ Translucencia Nucal.<br>
                        ✅ Hueso nasal del bebé.<br>
                        ✅ Ductus venoso.<br>
                        ☺️ Doppler Tricúspide.<br>
                        😌 Doppler de arterias uterinas.<br>
                        👶✅ Visualización de si el bebé tiene alto o bajo riesgo de Síndrome de Down, Patau o Edwards.<br>
                        ✅ Informe detallado.<br>
                        ✅ Fotos de la ecografía en 2D a blanco y negro.
                    </p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Puedo obtener la grabación de la ecografía genética?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">Si deseas la grabación de la ecografía, puedes cancelar un adicional de S/.10.00. Esto es OPCIONAL 👶✅</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Cuál es el precio de la ecografía Doppler?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">👉 El precio de nuestra ecografía Doppler es de S/.180.00 🏥</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Cuándo se realiza la ecografía Doppler?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">✅ Esta ecografía se realiza entre las semanas 28 a 32 de gestación.</p>
                </details>
                
                <details class="bg-white p-4 mb-4 rounded-lg shadow-md transition-all duration-300 hover:bg-femisalud-100">
                    <summary class="text-xs sm:text-lg font-semibold text-gray-800 cursor-pointer select-none">
                        <strong>¿Qué incluye la ecografía Doppler?</strong>
                    </summary>
                    <p class="mt-2 text-gray-700 text-xs sm:text-lg">
                        ✅ Evaluación de la placenta.<br>
                        ✅ Evaluación de la cantidad de líquido amniótico.<br>
                        ✅ Evaluación del bebé.<br>
                        ✅ Evaluación de las arterias uterinas.<br>
                        ✅ Evaluación de la arteria umbilical.<br>
                        ✅ Informe detallado.<br>
                        ✅ Fotos de la ecografía en 2D a blanco y negro.
                    </p>
                </details>
                
                <div class="w-full text-center mt-4">
                    <button id="contactStaffBtn" class="w-full font-bold bg-white text-black py-2 px-4 rounded-md shadow-md hover:bg-gray-200 transition-all duration-300">
                        Comunicarse con algún personal
                    </button>
                </div>
            `;

            faqMessage.appendChild(faqContent);
            messagesContainer.appendChild(faqMessage);

            isFirstMessage = false; // Marcar que ya no es el primer mensaje

            document.getElementById('contactStaffBtn').addEventListener('click', function () {
                let staffMessage = document.createElement('div');
                staffMessage.classList.add('flex', 'items-start', 'space-x-4', 'justify-start');

                let staffContent = document.createElement('div');
                staffContent.classList.add('bg-femisalud-900', 'text-white', 'p-4', 'rounded-xl', 'max-w-[80%]', 'shadow-md');
                staffContent.innerHTML = `
            😊 Muchas gracias por contactarnos. Dentro de unos momentos, uno de nuestros especialistas le estará atendiendo. Por favor, manténgase atento. 🙌
        `;

                staffMessage.appendChild(staffContent);
                messagesContainer.appendChild(staffMessage);
                faqContent.classList.add('hidden'); // Ocultar las preguntas frecuentes

                messagesContainer.scrollTop = messagesContainer.scrollHeight; // Hacer scroll hasta el último mensaje
            });
        }
    }
});

// Evento para enviar mensaje con la tecla Enter
document.getElementById('messageInput').addEventListener('keydown', function(e) {
    if (e.key === 'Enter') {
        e.preventDefault();  // Prevenir la acción predeterminada de Enter (nueva línea)
        document.getElementById('sendMessageBtn').click();  // Simula un clic en el botón de enviar
    }
});

// Manejo de la carga de imágenes
document.getElementById('imageInput').addEventListener('change', function(e) {
    let file = e.target.files[0];

    if (file) {
        // Crear el modal de recorte
        let modal = document.createElement('div');
        modal.classList.add('fixed', 'top-0', 'left-0', 'w-full', 'h-full', 'bg-black', 'bg-opacity-50', 'flex', 'justify-center', 'items-center', 'z-50');

        let modalContent = document.createElement('div');
        modalContent.classList.add('bg-white', 'p-6', 'rounded-lg', 'max-w-[90%]', 'max-h-[80%]', 'overflow-auto');
        modal.appendChild(modalContent);

        // Vista previa de la imagen
        let reader = new FileReader();
        reader.onload = function(event) {
            let imagePreview = document.createElement('img');
            imagePreview.src = event.target.result;
            imagePreview.classList.add('max-w-full', 'max-h-[70vh]', 'object-contain', 'rounded-lg');
            modalContent.appendChild(imagePreview);

            // Crear el contenedor para recortar con los botones
            let cropContainer = document.createElement('div');
            cropContainer.classList.add('relative', 'w-full', 'h-[60vh]');
            cropContainer.appendChild(imagePreview);

            // Crear el botón de recorte
            let cropButton = document.createElement('button');
            cropButton.classList.add('absolute', 'top-2', 'right-2', 'bg-femisalud-900', 'text-white', 'p-2', 'rounded-full');
            cropButton.innerHTML = '<i class="bi bi-crop"></i>';
            cropContainer.appendChild(cropButton);

            // Crear el botón de cancelar
            let cancelButton = document.createElement('button');
            cancelButton.classList.add('absolute', 'top-2', 'left-2', 'bg-gray-500', 'text-white', 'p-2', 'rounded-full');
            cancelButton.innerHTML = '<i class="bi bi-x"></i>';
            cropContainer.appendChild(cancelButton);

            // Agregar el contenedor al modal
            modalContent.appendChild(cropContainer);

            // Inicializar Cropper.js
            let cropper = new Cropper(imagePreview, {
                aspectRatio: NaN,  // Sin restricción de aspecto
                viewMode: 2,  // No dejar que el recorte se salga del contenedor
                dragMode: 'move',  // Permitir mover la imagen al hacer zoom
                zoomable: true,  // Permitir hacer zoom
                scalable: true,  // Permitir redimensionar el área de recorte
                ready() {
                    console.log('Listo para recortar');
                }
            });

            cropButton.addEventListener('click', function() {
                // Obtener la imagen recortada
                let croppedCanvas = cropper.getCroppedCanvas();
                croppedCanvas.toBlob(function(blob) {
                    let formData = new FormData();
                    formData.append('croppedImage', blob);

                    // Agregar la imagen recortada al chat
                    let newMessage = document.createElement('div');
                    newMessage.classList.add('flex', 'items-start', 'space-x-4', 'justify-end');

                    let messageContent = document.createElement('div');
                    messageContent.classList.add('bg-femisalud-900', 'text-white', 'p-4', 'rounded-xl', 'max-w-[80%]', 'shadow-md');
                    let imgElement = document.createElement('img');
                    imgElement.src = URL.createObjectURL(blob);
                    imgElement.classList.add('max-w-[200px]', 'rounded-lg');
                    messageContent.appendChild(imgElement);

                    // Crear un contenedor para la hora
                    let messageTime = document.createElement('div');
                    messageTime.classList.add('text-sm', 'text-gray-400', 'mt-1');
                    let currentTime = new Date();
                    let hours = currentTime.getHours().toString().padStart(2, '0');
                    let minutes = currentTime.getMinutes().toString().padStart(2, '0');
                    messageTime.innerHTML = `${hours}:${minutes}`;

                    // Añadir el contenido de la imagen y la hora al contenedor
                    newMessage.appendChild(messageContent);
                    newMessage.appendChild(messageTime);

                    // Agregar el nuevo mensaje al final
                    messagesContainer.appendChild(newMessage);

                    messagesContainer.scrollTop = messagesContainer.scrollHeight; // Hacer scroll hasta el último mensaje
                });
            });

            cancelButton.addEventListener('click', function() {
                // Cerrar el modal
                modal.remove();
            });
        };

        reader.readAsDataURL(file);
        document.body.appendChild(modal);
    }
});
