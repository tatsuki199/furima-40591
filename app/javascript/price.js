function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const taxAmount = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = taxAmount;
    const addSalesProfit = document.getElementById("profit");
    const salesProfit = (inputValue - taxAmount);
    addSalesProfit.innerHTML = salesProfit;
  })
};

window.addEventListener('turbo:load', price);
window.addEventListener("turbo:render", price);