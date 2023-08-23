import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of item
  final List _shopItems=[
    //{itemname,itemPrize,imagepath,color}
    ["Apple","80.0","lib/images/Apple.png",Colors.green[100]],
    ["Banana","40.0","lib/images/banana.png",Colors.yellow[100]],
    ["Strawberry","100.0","lib/images/Strawberry.png",Colors.pink[100]],
    ["Dragon Fruit","150.0","lib/images/dragon.png",Colors.orange[100]],
    ["Water Bottle","20.0","lib/images/Bottel.png",const Color.fromRGBO(3, 169, 244, 1)],
    ["Soap","30.0","lib/images/soap.png",Colors.lime[100]],
    ["corn flakes","90.0","lib/images/chocs.png",Colors.amber[100]],
    ["Niva body wash","140.0","lib/images/Body wash.jpg",Colors.blue[100]],
    ["Chicken","240.0","lib/images/Chicken.png",Colors.redAccent],
    ["Fish","200.0","lib/images/fish.png",Colors.deepPurpleAccent[100]],
    ["Shrimp","300.0","lib/images/shrimp.png",Colors.cyan[100]],
    
  ];

  List _cartitems =[];

  get shopItem =>_shopItems;

  get cartItems => _cartitems;

  //add item to cart
 void additemToCart(int index){
  _cartitems.add(_shopItems[index]);
  notifyListeners();
 }

  //remove item from cart
  void removeitemFromCart(int index){
    _cartitems.removeAt(index);
    notifyListeners();
  }
 
  //calculate total price
    String calculatrTotal(){
      double totalPrice = 0 ;
      for(int i=0; i < _cartitems.length; i++){
        totalPrice += double.parse(_cartitems[i][1]);

      }
      return totalPrice.toStringAsFixed(2);
    }
}