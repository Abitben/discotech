var cards = document.getElementsByClassName("card")
console.log(cards)

function randomColor(){
  let r = Math.floor(Math.random()*256);
  let g = Math.floor(Math.random()*256);
  let b = Math.floor(Math.random()*256);
  console.log(r)
  console.log(`rgba(${r},${g},${b}, 0.45)`)
  return `rgba(${r},${g},${b}, 0.45)`
}

for (let i = 0; i < cards.length; i++) {
console.log(cards[i])
cards[i].style.backgroundColor = randomColor()
};