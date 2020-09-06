window.addEventListener('load', price);

function price(){
  const priceInput = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener('keyup', () => {
    const value = priceInput.value;

    if (value >= 300 && value <= 9999999){
      add_tax.textContent = value * 0.1;
      profit.textContent = value * 0.9;
    } else {
      (add_tax, profit).textContent = 'NaN';
    }
  });
}