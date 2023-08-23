import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/home_page.dart';
import 'package:grocery/screens/reusabelButton.dart';
import 'package:grocery/screens/singup_screen.dart';

class singInScreen extends StatefulWidget {
  const singInScreen({super.key});

  @override
  State<singInScreen> createState() => _singInScreenState();
}

class _singInScreenState extends State<singInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: <Widget>[
          logoWidget("assets/icon/login.png"),    
          resuableTextField('Enter Email_id', Icons.person_outline, false,
              _emailTextController),
          SizedBox(
            height: 6,
          ),
          resuableTextField('Enter Password', Icons.lock_outline, false,
              _passwordTextController),

          singInSingUpButton(context, true, () {
            FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage()));
            }).onError((error, stackTrace) {
              print("Error ${error.toString()}");
            });
          }),
          singUpOption(),
        ],
      ),
    );
  }

  Row singUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => singupscreen()));
          },
          child: const Text(
            "  Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
