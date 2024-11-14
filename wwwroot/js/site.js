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

const a = document.querySelector(".id-restaurante")
console.log(a+ "holaaa")