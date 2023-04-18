const body = document.body;
const boldbutton = document.getElementById("bold-button");
const unboldbutton = document.getElementById("unbold-button");
const para = document.getElementsByTagName("p");
const list = document.getElementsByTagName("li");
const hello_world_button = document.getElementById("hello-world-button");
const images = ["cookie1.jpg", "cookie2.jpg", "cookie3.jpg"];
const nextImageButton = document.querySelector("#next_image_button");
const imageElement = document.querySelector("#cookie-image");
const jokebutton = document.querySelector("#new-joke");
const joke = document.querySelector("#joke");

hello_world_button.addEventListener("click", function () {
  alert("Sriharsha");
});

boldbutton.addEventListener("click", function () {
  for (let i = 0; i < para.length; i++) {
    para[i].style.fontWeight = "bold";
  }
});

boldbutton.addEventListener("click", function () {
  for (let i = 0; i < list.length; i++) {
    list[i].style.fontWeight = "bold";
  }
});

unboldbutton.addEventListener("click", function () {
  for (let i = 0; i < para.length; i++) {
    para[i].style.fontWeight = "normal";
  }
});
unboldbutton.addEventListener("click", function () {
  for (let i = 0; i < list.length; i++) {
    list[i].style.fontWeight = "normal";
  }
});

let i = 0;
nextImageButton.addEventListener("click", function () {
  i++;
  if (i >= images.length) {
    i = 0;
  }
  imageElement.src = "images/" + images[i];
});

jokebutton.addEventListener("click", function () {
  fetch("https://official-joke-api.appspot.com/random_joke")
    .then((Response) => Response.json())
    .then((data) => {
      joke.textContent = data.setup + " " + data.punchline;
    })
    .catch((error) => console.log(error));
});

// var toggleButton = document.querySelector("dark-mode-switch");
// toggleButton.addEventListener("click", () => {
//   var body = document.querySelector("body");
//   body.classList.toggle("dark");
// });

// const styles = `
//   .dark {
//     background-color: #333;
//   }
// `;

// const styleElement = document.createElement("style");
// styleElement.innerText = styles;

// document.head.appendChild(styleElement);

var toggleButton = document.querySelector("#dark-mode-switch");
toggleButton.addEventListener("click", () => {
  var body = document.getElementsByTagName("body")[0];
  if(toggleButton.checked == true){
    body.style.backgroundColor= "grey";
  }else{
    body.style.backgroundColor= "#f2f2f2";
  }
});