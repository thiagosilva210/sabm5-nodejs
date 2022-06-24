const lewindowDOM = document.querySelector(".leWindow");
const lewindowOverlay = document.querySelector(".leWindow-overlay");
const closeLewindowBtn = document.querySelector(".close-leWindow");
const lewindowBtn = document.getElementById("leWindow-btn-1");

const productsDOM = document.querySelector(".products-center");

lewindowBtn.addEventListener("click", () => {
  showCategories();
});

closeLewindowBtn.addEventListener("click", () => {
  hideLewindow();
});

function showCategories() {
  lewindowOverlay.classList.add("transparentBcg");
  lewindowDOM.classList.add("showLeWindow");
}

function hideLewindow() {
  lewindowOverlay.classList.remove("transparentBcg");
  lewindowDOM.classList.remove("showLeWindow");
}
