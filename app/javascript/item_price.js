function pay() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.ceil(inputValue * 0.9).toLocaleString();
  });
}

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);