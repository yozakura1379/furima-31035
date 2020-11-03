window.addEventListener('load', () => {




  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  item_price.addEventListener("input", () => {
    const inputValue = item_price.value;
    
    const tax = Math.trunc(inputValue / 10)
    add_tax_price.innerHTML = tax
    profit.innerHTML = inputValue - tax
     //Math.truncオブジェクトとメソッドを使って小数点以下の表示をなくす
   
  })
})