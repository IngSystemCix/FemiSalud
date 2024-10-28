function exportClinicalNotes() {
    // Obtén el valor seleccionado en el combobox (DNI de la paciente)
    const patientSelect = document.getElementById("patientSelect");
    const dni = patientSelect.value;

    // Redirige al servlet con el DNI como parámetro
    window.location.href = `/femisalud/export_clinical_notes?dni=${dni}`;
}