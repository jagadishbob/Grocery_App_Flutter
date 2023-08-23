import 'package:flutter/material.dart';
import 'package:grocery/home_page.dart';

class paymentSucess extends StatefulWidget {
  const paymentSucess({super.key});

  @override
  State<paymentSucess> createState() => _paymentSucessState();
}

class _paymentSucessState extends State<paymentSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('lib/images/sucess.gif'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Your Payment was Done Sucessfully',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: GestureDetector(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage();
              })),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '     OK     ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
            ),
          ))
        ],
      ),
    );
  }
}
