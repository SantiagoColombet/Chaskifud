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
    const idRestauranteCarrito = document.getElementById("IdRestauranteCarrito")
        ? parseInt(document.getElementById("IdRestauranteCarrito").value.trim())
        : null;


    const submitButtons = document.querySelectorAll(".restaurante-boton");

    submitButtons.forEach((submitBtn) => {
        submitBtn.addEventListener("click", function (event) {
            event.preventDefault();

            const form = this.closest("form");

            const idRestauranteElement = form.querySelector(".id-restaurante");

            if (!idRestauranteElement) {
                console.error("No se encontró el elemento con clase .id-restaurante en el formulario.");
                return;
            }

            const idRestauranteSeleccionado = parseInt(idRestauranteElement.value.trim());

            console.log("ID Restaurante Seleccionado:", idRestauranteSeleccionado);

            if (idRestauranteCarrito !== null && idRestauranteCarrito !== idRestauranteSeleccionado) {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "No puedes seleccionar un restaurante diferente al del carrito.",
                });
            } else {
                form.submit();
            }
        });
    });
});

const user = document.querySelector(".img-carrito-usuario");

user.addEventListener("click", () =>{ 
    Swal.fire({
        icon: "error",
        title: "Error",
        text: "Necesitas iniciar sesion para acceder al carrito",
    });


})


// if (!sessionStorage.getItem("contador")) {
//     sessionStorage.setItem("contador", "0");
// }
// const imgCheck = document.querySelector(".imagen-global-index")
// let imgValue = imgCheck.value
// console.log(imgCheck)
// if (parseInt(sessionStorage.getItem("contador")) < 1 &&  imgCheck.value == imgValue) {
//     const imagenInput = document.querySelector(".imagen-global-index");
//     if (imagenInput) {
//         const imagenIndex = imagenInput.value; 
//         console.log(" Hola siiiii" +imagenIndex );

//         localStorage.setItem("imagenIndex", imagenIndex);
//         console.log("Imagen guardada en localStorage: " + imagenIndex);

//         sessionStorage.setItem("contador", "1");
//     } else {
//         console.error("No se encontró el elemento .imagen-global-index");
//     }
// }

// const recuperado = localStorage.getItem("imagenIndex");
// if (recuperado) {
//     console.log("Valor recuperado: " + recuperado);

//     const imagenPerfil = document.querySelector("#imagen_perfil");
//     if (imagenPerfil) {
//         imagenPerfil.src = "../Images/" + recuperado; 
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





const swiper = new Swiper('.swiper-container', {
    slidesPerView: 3,
    spaceBetween: 0,
    loop: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    breakpoints: {
        640: {
            slidesPerView: 2,
            spaceBetween: 0,
        },
        1024: {
            slidesPerView: 3,
            spaceBetween: 0,
        },
    },
});