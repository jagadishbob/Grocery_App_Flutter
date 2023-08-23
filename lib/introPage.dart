import 'package:flutter/material.dart';
import 'package:grocery/screens/singin_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Column(children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              
              child: Image.asset("assets/icon/final.png"),
            ),
            SizedBox(
              height: 80,
            ),

            Text("We deliver fresh food at your door step",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold) ,),
            SizedBox(
              height: 40,
            ),



            Text("Fresh items everyday",
            style: TextStyle(fontSize: 20),),


 SizedBox(
              height: 40,
            ),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
              return singInScreen();
            },
            )),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Get started",
                style: TextStyle(fontSize: 25,color: Colors.white),),
              ),
            ),
          )

          ],)
        ),
      ),
    );
  }
}