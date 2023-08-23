import 'package:flutter/material.dart';
import 'package:grocery/model/cart_page.dart';
import 'package:grocery/components/grocery_page.dart';
import 'package:grocery/model/cartmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(
              context, MaterialPageRoute(

                builder: (context) {
          return CartPage();
        })),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "Happy Shopping, Have a Good Day.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(45.0),
          child: Text(
            "Let's Order Fresh Items for You",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),

        //divider
        Divider(
          thickness: 4,
        ),

        //text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text("Fresh Items",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),

        Expanded(
          child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                itemCount: value.shopItem.length,
                padding: EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return GroceryPage(
                    itemName: value.shopItem[index][0],
                    itemPrice: value.shopItem[index][1],
                    imagePath: value.shopItem[index][2],
                    color: value.shopItem[index][3],
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false).additemToCart(index);
                    },
                  );
                },
              );
            },
          ),
        ),
      ])),
    );
  }
}
