var formBtn = document.querySelector('#login-btn');
var formBtn2 = document.querySelector('#memberView-btn');
var loginForm = document.querySelector('.login-form-container');
var memberViewForm = document.querySelector('.memberView-form-container');
var formClose = document.querySelector('#form-close');


window.onscroll = () =>{
    loginForm.classList.remove('active');
    memberViewForm.classList.remove('active');
}



if(formBtn != undefined) {
formBtn.addEventListener('click', () =>{
    loginForm.classList.add('active');
});
}

if(formBtn2 != undefined) {
formBtn2.addEventListener('click', () =>{
    memberViewForm.classList.add('active');
});
}

var swiper = new Swiper(".review-slider", {
    spaceBetween: 20,
    loop:true,
    autoplay: {
        delay: 2500,
        disableOnInteraction: false,
    }
});

if(memberViewForm != undefined) {
formClose.addEventListener('click', () =>{
    
    memberViewForm.classList.remove('active');
    
});
} else {
formClose.addEventListener('click', () =>{
    
    loginForm.classList.remove('active');
    
});
}