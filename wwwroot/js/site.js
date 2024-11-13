document.addEventListener('DOMContentLoaded', function() {
    var errorMsg = document.querySelector('.error-msg');
    
    if (errorMsg) {
        anime({
            targets: '.error-msg',            
            width: '100%', 
            easing: 'easeInOutQuad',
            direction: 'alternate'
        
        });
    }
});
