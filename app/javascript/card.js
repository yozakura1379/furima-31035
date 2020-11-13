const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
   
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    console.log(formData);
    const card = {
      number: formData.get("number"),  //ここのnumberは検証で出るnameの属性値、今回ならクレジットのカード情報
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`, // ここのpurchases[exp_year]のようにモデル名が必要な時はform_wihtでモデルを指定している時のみ、今回は複数のモデルを保存するためモデルを指定してないからモデル名がいらない
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
    
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
    
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);