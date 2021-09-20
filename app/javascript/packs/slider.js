var num = 0;
const slides = document.getElementsByClassName('slide')
const prevArrow = document.getElementById('prevArrow')
const nextArrow = document.getElementById('nextArrow')
const dots = document.getElementsByClassName("dot");
const length = slides.length


const goToNextSlide = () => {
  if(num >= length-1){
    num = 0
  }else{
    num ++
  }
}

const goToPrevSlide = () => {
  if(num <= 0){
    num = length-1
  }else{
    num --
  }
}

const showSlide = () => {
  for(i = 0; i < slides.length; i++){
    slides[i].style.display = "none";
  }
  slides[num].style.display = "block"

  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  dots[num].className += " active";
}

setInterval(function(){
  goToNextSlide();
  showSlide(); 
 }, 5000);

showSlide()




document.addEventListener('turbolinks:load', () => {
  
  document.querySelectorAll('.dot').forEach(dot => {
    dot.addEventListener('click', (event) => {
      num = dot.dataset.num
      showSlide()
    })
    
  });

  prevArrow.addEventListener('click', (event) => {
    goToPrevSlide()
    showSlide()
  })

  nextArrow.addEventListener('click', (event) => {
    goToNextSlide()
    showSlide()
  })
});