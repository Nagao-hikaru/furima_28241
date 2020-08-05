function calc() {
  const content_value = document.getElementById("item_price");
  let tax_price = document.getElementById("add-tax-price");
  let profit = document.getElementById("profit");



  
  content_value.addEventListener('input', (e) =>{
    let price = (content_value.value);
    let tax = price * 0.1;
    let benefit = price - tax

    tax = Math.round(tax);
    benefit = Math.round(benefit);
    // console.log(tax)
    // console.log(tax_price)
    var result = /(?<!0)\d+/
    var result = /\n/
    // console.log(result)

    if ( price.match(result)){
      tax_price.innerHTML = tax
      profit.innerHTML = benefit
    } else {
      tax_price.innerHTML = "半角数字のみ入力可能"
      profit.innerHTML = "半角数字のみ入力可能"
    }


    // if (benefit){
    //   profit.innerHTML = benefit
    // } else{
    //   profit.innerHTML = "半角数字のみ入力可能"
    // }

    
  });

}

window.addEventListener("load", calc);

