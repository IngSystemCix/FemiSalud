const dateStartInput = document.getElementById('date_start_pregnancy');
const dateEndInput = document.getElementById('date_end_pregnancy');

dateStartInput.addEventListener('input', () => {
    // Obtén la fecha de inicio
    const startDate = new Date(dateStartInput.value);
    if (isNaN(startDate)) return;

    // Suma 9 meses
    const endDate = new Date(startDate);
    endDate.setMonth(endDate.getMonth() + 9);

    const year = endDate.getFullYear();
    const month = String(endDate.getMonth() + 1).padStart(2, '0');
    const day = String(endDate.getDate()).padStart(2, '0');
    dateEndInput.value = `${year}-${month}-${day}`;
});