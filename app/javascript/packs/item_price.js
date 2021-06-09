window.addEventListener("load", function(){
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = priceInput.value / 10;

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = priceInput.value - addTaxDom.innerHTML
  })
});
