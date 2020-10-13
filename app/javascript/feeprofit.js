function count (){
  const itemPrice  = document.getElementById("item-price");
  const addTaxPrice  = document.getElementById("add-tax-price");
  const profit  = document.getElementById("profit");
  itemPrice.addEventListener("keyup", () => {
  const iP = itemPrice.value
  const ten = Math.floor(iP * 0.1);
  const ninety = Math.floor(iP * 0.9);
  addTaxPrice.innerHTML = `${ten.toLocaleString()}`
  profit.innerHTML = `${ninety.toLocaleString()}`
  });
}

window.addEventListener('load', count);