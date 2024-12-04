document.addEventListener("DOMContentLoaded", function () {
    // Establecer el valor máximo para los campos de fecha al día de hoy
    const currentDate = new Date().toISOString().split('T')[0];
    document.getElementsByName('date')[0].setAttribute('max', currentDate);
    document.getElementsByName('date_start_pregnancy')[0].setAttribute('max', currentDate);
});