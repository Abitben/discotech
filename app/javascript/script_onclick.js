const rectboxes = document.querySelectorAll(".rect-box");

const copyColor = function (event) {
  const target = event.target.nextSibling.nextSibling;
  originalValue = target.innerHTML;
  navigator.clipboard.writeText(target.innerHTML);
  target.innerHTML = "Copied";
  setTimeout(() => {
    target.innerHTML = originalValue;
  }, 1000);
};

for (let i = 0; i < rectboxes.length; i++) {
  rectboxes[i].addEventListener("click", copyColor);
}
