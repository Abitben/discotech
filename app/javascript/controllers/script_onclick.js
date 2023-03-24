const rectboxes = document.querySelectorAll(".rect-box");

const copyColor = function (event) {
  const target = event.target.nextSibling.nextSibling;
  let original_value = target.innerHTML;
  console.log(original_value)
  navigator.clipboard.writeText(target.innerHTML);
  target.innerHTML = "Copied";
  setTimeout(() => {
    target.innerHTML = original_value;
  }, 1000);
};

for (let i = 0; i < rectboxes.length; i++) {
  rectboxes[i].addEventListener("click", copyColor);
}
