
const shoppingCartKey = "cart";

// Maps the ID of each item to the item name (indexes are the item id tags used in html)
const itemIDNameList = ['Leaf Blower', 'Lawn Mower', 'Hose', 'Chef Knife', 'Dish Soap', 'Paper Towels' , 'Sheet Set', 'Pillow', 'Night Light'];
// maps the ID of each item to the item price (indexes are the item id tags used in html)
const itemIDPriceList = [100,  375,  20, 30,  3, 2, 87,  22,  10 ];

function addItemToCart(itemID) {
 
    let shoppingCart = getCurrentShoppingCart();

    let itemName = itemIDNameList[itemID];

    shoppingCart.push(itemName);
    
    let stringData = JSON.stringify(shoppingCart);
    localStorage.setItem(shoppingCartKey, stringData);


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
   let cartTotal = 0;

   for (i = 0; i < currentCart.length; i++) {
     let itemCost = retrieveItemPrice(currentCart[i]);
     cartTotal += itemCost;

     let newCartItem = document.createElement('li');
     newCartItem.className = "list-group-item d-flex justify-content-between lh-sm cart-list-item";
     
     let newCartItemText= document.createElement("h6");
     newCartItemText.className = "my-0";
     newCartItemText.innerHTML = currentCart[i];
     newCartItem.appendChild(newCartItemText);
     
     let newCartItemPrice = document.createElement("span");
     newCartItemPrice.className = "text-muted";
     newCartItemPrice.innerHTML = `$${itemCost}`;
     newCartItem.appendChild(newCartItemPrice);
     
     cartList.appendChild(newCartItem);
   }

   let totalCostItem = document.createElement("li");
   totalCostItem.class = "list-group-item d-flex justify-content-between";
   
   let displayCostItem = document.createElement("span");
   displayCostItem.innerHTML = "Total (USD)"
   totalCostItem.appendChild(displayCostItem);

   let totalCostDisplayItem = document.createElement("strong")
   totalCostDisplayItem.innerHTML = `$${cartTotal}`;
   totalCostItem.appendChild(totalCostDisplayItem);

   cartList.appendChild(totalCostItem);

   return

 }

 function retrieveItemPrice(itemName) {
   itemID = itemIDNameList.indexOf(currentCart[i])
   console.log(itemIDPriceList[itemID])
   return itemIDPriceList[itemID];

}

 function clearCart() {
   localStorage.clear();
   let cartList = document.getElementById('cart-list')
   if (!cartList) {
      return;
      }

   while( cartList.firstChild ){
    cartList.removeChild( cartList.firstChild );
  }

 }