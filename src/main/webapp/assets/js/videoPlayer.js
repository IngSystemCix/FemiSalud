const player = new Plyr('#player', {
    controls: ['play-large','play', 'progress', 'duration', 'volume', 'quality', 'speed', 'settings', 'download', 'pip', 'fullscreen'],
    settings: ['quality', 'speed'], // Incluye 'speed' en los ajustes.
    quality: {
        default: 576, // Calidad predeterminada.
        options: [4320, 2880, 2160, 1440, 1080, 720, 576, 480, 360, 240],
        forced: true,
        onChange: (quality) => {
            console.log(`Quality changed to: ${quality}`);
        },
    },
    speed: {
        selected: 1, // Velocidad predeterminada.
        options: [0.5, 0.75, 1, 1.25, 1.5, 2], // Opciones de velocidad.
    },
});
