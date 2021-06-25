
const shoppingCartKey = "cart";
let itemIDNameList = [['Leaf Blower', 100], ['Lawn Mower', 375], ['Hose', 20], ['Chef Knife', 30], ['Dish Soap', 3], ['Paper Towels', 2] , ['Sheet Set', 87], ['Pillow', 22], ['Night Light', 10 ]]

function addItemToCart(itemID) {
 
    let shoppingCart = getCurrentShoppingCart();

    let itemName = itemIDNameList[itemID][0];

    addItemToCartPage(itemName);

    shoppingCart.push(itemName);
    
    let stringData = JSON.stringify(shoppingCart);
    localStorage.setItem(shoppingCartKey, stringData);


}

function addItemToCartPage(itemName) {
  return;
}

function getCurrentShoppingCart() {
  let stringData = localStorage.getItem(shoppingCartKey);
  let shoppingCart = [];
  if (stringData) {
    shoppingCart = JSON.parse(stringData);
    }

  return shoppingCart;
 }

 function displayShoppingCart() {
   currentCart = getCurrentShoppingCart();
   let cartList = document.getElementById('cart-list')
   if (!cartList) {
      return;
      }

   for (i = 0; i < currentCart.length; i++) {
     let newCartItem = document.createElement('li');
     newCartItem.className = "cart-list-item";
     newCartItem.innerHTML = currentCart[i];
     cartList.appendChild(newCartItem);
   }
 }