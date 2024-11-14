document.addEventListener('DOMContentLoaded', function() {
    var errorMsg = document.querySelector('.error-msg');
    
    if (errorMsg) {
        errorMsg.style.transform = 'scale(0)';
        errorMsg.style.opacity = 0;

        anime({
            targets: '.error-msg',
            scale: [0, 1],    
            opacity: [0, 1],
            easing: 'easeOutQuad',
            duration: 10   
        });
    }
});

// Error Pop up

// const popUp = document.querySelector(".js")
// const btnAgregar = document.querySelectorAll(".enviar_rest")
// console.log(btnAgregar);
// let msg = popUp.innerHTML;
// console.log(msg)

// btnAgregar.forEach((item) => {
//     item.addEventListener('click', () => {
//         if(msg == "True"){
//             Swal.fire({
//                 icon: "error",
//                 title: "Oops...",
//                 text: "Something went wrong!",
//                 footer: '<a href="#">Why do I have this issue?</a>'
//               });
//         }
//     })


// })

document.addEventListener("DOMContentLoaded", () => {
    // Obtenemos el ID del primer restaurante en el carrito, si existe
    const idRestauranteCarrito = document.getElementById("IdRestauranteCarrito")
        ? parseInt(document.getElementById("IdRestauranteCarrito").value)
        : null;

    // Seleccionamos todos los botones de envío
    const submitButtons = document.querySelectorAll(".enviar_rest");

    submitButtons.forEach((submitBtn) => {
        submitBtn.addEventListener("click", function (event) {
            // Previene el envío del formulario de inmediato
            event.preventDefault();
            // Obtenemos el formulario actual
            const form = this.closest("form");
            console.log(form)
            // Intentamos obtener el elemento con clase .id-restaurante dentro del formulario


            const idRestauranteElement = form.querySelector(".id-restaurante");

            // Verificamos si el elemento con .id-restaurante existe
            if (!idRestauranteElement) {
                console.error("No se encontró el elemento con clase .id-restaurante en el formulario.");
                return;
            }

            // Obtenemos el ID del restaurante seleccionado
            const idRestauranteSeleccionado = parseInt(idRestauranteElement.innerText);
            // Lógica para verificar el carrito
            if (idRestauranteCarrito !== null && idRestauranteCarrito !== idRestauranteSeleccionado) {
                // Si el carrito no está vacío y el ID no coincide, muestra el mensaje de error
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "No puedes seleccionar un restaurante diferente al del carrito.",
                    footer: "<a href='#'>¿Necesitas ayuda?</a>",
                });
            } else {
                // Si el carrito está vacío o los IDs coinciden, envía el formulario
                form.submit();
            }
        });
    });
});
