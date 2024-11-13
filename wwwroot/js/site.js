document.addEventListener('DOMContentLoaded', function() {
    var errorMsg = document.querySelector('.error-msg');
    
    if (errorMsg) {
        // Primero ocultamos el mensaje de error (opcional)
        errorMsg.style.transform = 'scale(0)';
        errorMsg.style.opacity = 0;

        // Animación de expansión
        anime({
            targets: '.error-msg',
            scale: [0, 1],    // Expande desde el centro
            opacity: [0, 1],  // También aumentamos la opacidad
            easing: 'easeOutQuad',
            duration: 10   // Duración de la animación
                // Retardo opcional
        });
    }
});
