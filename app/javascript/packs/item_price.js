window.addEventListener("load", function(){
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = priceInput.value / 10;
    console.log(Math.floor(addTaxDom.innerHTML));

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = priceInput.value - addTaxDom.innerHTML
    console.log(Math.floor(addProfitDom.innerHTML));
  })
});
