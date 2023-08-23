import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GroceryPage extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

   GroceryPage({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //image
          Image.asset(
            imagePath,
            height: 64,
            ),
    
          //item name
          Text(itemName),
    
          //Price + button
MaterialButton(
  onPressed: onPressed,
  color: color,
  child: Text(
    'RS.' + itemPrice,
  style: const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),),
  )

        ],
        ),
      ),
    );
  }
}
