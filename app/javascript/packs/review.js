// レビュー機能
const stars = document.querySelector(".ratings").children;
const ratingValue = document.getElementById("rating-value");
const ratingValueDisplay = document.getElementById("rating-value-display");

let index;

for (let i = 0; i < stars.length; i++) {  //starsは５なので、５回繰り返す
  // マウスを乗せた時、白星が黒星に変わる
  stars[i].addEventListener("mouseover", function () {
    for (let j = 0; j < stars.length; j++) {  //starsは５なので、５回繰り返す、全ての星をfa-star（黒）からfa-star-o（白）にする
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }
    for (let j = 0; j <= i; j++) {            //starsは５なので、５回繰り返す、全ての星をfa-star-o（白）からfa-star（黒）にする
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  });

  // マウスを外した時の処理
  stars[i].addEventListener("mouseout", function () {
    for (let j = 0; j < stars.length; j++) {
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }
    for (let j = 0; j <= index; j++) {
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  });

  // クリックした時の処理
  stars[i].addEventListener("click", function () {
    ratingValue.value = i + 1;
    ratingValueDisplay.textContent = ratingValue.value;
    index = i;
  });
}




