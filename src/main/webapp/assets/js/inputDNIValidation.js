document.getElementById("dni").addEventListener("input", function (event) {
    const input = event.target;

    input.value = input.value.replace(/\D/g, "");

    if (input.value.length > 8) {
        input.value = input.value.slice(0, 8);
    }
});