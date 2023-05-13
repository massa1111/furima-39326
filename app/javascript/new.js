function post (){
 const itemPriceInput = document.getElementById('item-price');
itemPriceInput.addEventListener('input', () => {
  const sellingPrice = itemPriceInput.value;


  const commissionRate =sellingPrice * 0.1; 
  const commission = Math.floor(commissionRate); 
  const profit = sellingPrice - commission; 

 
  document.getElementById('add-tax-price').textContent = commission;
  document.getElementById('profit').textContent = profit;
});
};

window.addEventListener('load', post);