const pay = () => {
  const payjp = Payjp('pk_test_b4bfaee8aa0a5fbcc1fe07e6')// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc'); 
 
 
  numberElement.mount('#card-number');
  expiryElement.mount('#card-exp');
    cvcElement.mount('#card-cvc');
 
  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);