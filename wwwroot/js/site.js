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
    // Obtenemos el ID del restaurante en el carrito, si existe
    const idRestauranteCarrito = document.getElementById("IdRestauranteCarrito")
        ? parseInt(document.getElementById("IdRestauranteCarrito").value.trim())
        : null;


    // Seleccionamos todos los botones de envío en cualquier formulario
    const submitButtons = document.querySelectorAll(".restaurante-boton");

    submitButtons.forEach((submitBtn) => {
        submitBtn.addEventListener("click", function (event) {
            // Previene el envío del formulario de inmediato
            event.preventDefault();

            // Obtenemos el formulario actual
            const form = this.closest("form");

            // Intentamos obtener el elemento con clase .id-restaurante dentro del formulario
            const idRestauranteElement = form.querySelector(".id-restaurante");

            // Verificamos si el elemento con .id-restaurante existe
            if (!idRestauranteElement) {
                console.error("No se encontró el elemento con clase .id-restaurante en el formulario.");
                return;
            }

            // Obtenemos el ID del restaurante seleccionado
            const idRestauranteSeleccionado = parseInt(idRestauranteElement.value.trim());

            // Logs para depuración
            console.log("ID Restaurante Seleccionado:", idRestauranteSeleccionado);

            // Validación del carrito
            if (idRestauranteCarrito !== null && idRestauranteCarrito !== idRestauranteSeleccionado) {
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




// // Inicializar el contador solo si no existe en sessionStorage
// if (!sessionStorage.getItem("contador")) {
//     sessionStorage.setItem("contador", "0");
// }
// const imgCheck = document.querySelector(".imagen-global-index")
// // Verifica el contador y guarda la imagen solo la primera vez
// let imgValue = imgCheck.value
// console.log(imgCheck)
// if (parseInt(sessionStorage.getItem("contador")) < 1 &&  imgCheck.value == imgValue) {
//     const imagenInput = document.querySelector(".imagen-global-index");
//     if (imagenInput) {
//         const imagenIndex = imagenInput.value; // Verificar que el elemento existe antes de acceder al valor
//         console.log(" Hola siiiii" +imagenIndex );

//         // Guardar en localStorage
//         localStorage.setItem("imagenIndex", imagenIndex);
//         console.log("Imagen guardada en localStorage: " + imagenIndex);

//         // Incrementar el contador en sessionStorage
//         sessionStorage.setItem("contador", "1");
//     } else {
//         console.error("No se encontró el elemento .imagen-global-index");
//     }
// }

// // Recuperar el valor guardado en localStorage
// const recuperado = localStorage.getItem("imagenIndex");
// if (recuperado) {
//     console.log("Valor recuperado: " + recuperado);

//     // Configurar la imagen de perfil
//     const imagenPerfil = document.querySelector("#imagen_perfil");
//     if (imagenPerfil) {
//         imagenPerfil.src = "../Images/" + recuperado; // Asegúrate de que la ruta sea válida en tu proyecto MVC
//     } else {
//         console.error("No se encontró el elemento #imagen_perfil");
//     }
// } else {
//     console.error("No se encontró ninguna imagen guardada en localStorage");
// }

// const Logut = () => {
//     contador--;
//     localStorage.removeItem("imagenIndex");
//     sessionStorage.setItem("contador");
// }


