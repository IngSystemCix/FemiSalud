document.addEventListener("DOMContentLoaded", function () {
    // Obtener la fecha y hora actuales
    const currentDate = new Date();

    // Formatear la fecha a 'YYYY-MM-DD'
    const formattedDate = currentDate.toISOString().split('T')[0];

    // Formatear la hora a 'HH:MM'
    const formattedTime = currentDate.toISOString().split('T')[1].substring(0, 5);

    // Establecer el valor máximo para el campo de fecha y hora
    const maxDateTime = formattedDate + 'T' + formattedTime;
    document.getElementsByName('date')[0].setAttribute('max', maxDateTime);
});
