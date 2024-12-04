document.addEventListener('DOMContentLoaded', () => {
    fetch(`${window.location.origin}/femisalud/api/get-genre-and-pregnancy`)
        .then(response => response.json()) // Convertimos la respuesta a JSON
        .then(data => {
            // Asumimos que la respuesta es un array de objetos
            const genreAndTypePregnancy = data;

            // Esto asegura que tomamos el primer tipo de embarazo para utilizar en el procesamiento
            const firstTypeOfPregnancy = genreAndTypePregnancy[0]?.typePregnancy;

            // Establecer un retraso de 8 segundos (8000 milisegundos)
            setTimeout(() => {
                document.querySelector('#principal').classList.add('hidden');
                // Ahora iteramos sobre los datos y mostramos el contenido adecuado en función del tipo de embarazo
                genreAndTypePregnancy.forEach(genreAndType => {
                    if (firstTypeOfPregnancy === 'UNIQUE') {
                        if (genreAndType.genre === 'Mujer') {
                            document.getElementById("girlRevelation").classList.remove("hidden");
                        } else if (genreAndType.genre === 'Hombre') {
                            document.getElementById("boyRevelation").classList.remove("hidden");
                        }
                    } else if (firstTypeOfPregnancy === 'TWINS') {
                        document.getElementById("twinsRevelation").classList.remove("hidden");
                    } else if (firstTypeOfPregnancy === 'TRIPLETS') {
                        document.getElementById("tripletsRevelation").classList.remove("hidden");
                    } else if (firstTypeOfPregnancy === 'CUFFLINKS_F') {
                        document.getElementById("cufflinksGirlsRevelation").classList.remove("hidden");
                    } else if (firstTypeOfPregnancy === 'CUFFLINKS_M') {
                        document.getElementById("cufflinksBoysRevelation").classList.remove("hidden");
                    }
                });
            }, 8000); // Retraso de 8 segundos antes de ejecutar la revelación
        })
        .catch(error => {
            console.error('Error fetching genre and pregnancy data:', error);
        });
});
