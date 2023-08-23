import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screens/reusabelButton.dart';
import 'package:grocery/screens/singin_screen.dart';

class singupscreen extends StatefulWidget {
  const singupscreen({super.key});

  @override
  State<singupscreen> createState() => _singupscreenState();
}

class _singupscreenState extends State<singupscreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sing Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
     
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            120,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              logoWidget("assets/icon/register.png"),
              const SizedBox(
                height: 20,
              ),
              resuableTextField("Enter UserName", Icons.person_outline, false,
                  _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              resuableTextField("Enter Email Id", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              resuableTextField("Enter Password", Icons.lock_outline, false,
                  _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              singInSingUpButton(context, false, () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)
                  .then((value) {
                    print("Created new account");
                     Navigator.push(context,
                    MaterialPageRoute(builder: (context) => singInScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
              })
            ],
          ),
      )),
      ),
    );
  }
}
