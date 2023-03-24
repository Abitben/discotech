var acc = document.getElementsByClassName("myaccordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("myactive");
    var panel = this.nextElementSibling;
    console.log(this)
    this.style.borderBottomRightRadius = "0px" ;
    this.style.borderBottomLeftRadius = "0px" ;

    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
      this.style.borderBottomRightRadius = "40px" ;
      this.style.borderBottomLeftRadius = "40px" ;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}
