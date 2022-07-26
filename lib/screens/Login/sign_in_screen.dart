import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  void _signUp() async{
    try{
      await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: "barry.allen@example.com",
          password: "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password'){
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  void _signIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "barry.allen@example.com", password: "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found'){
        print('No user found for that email.');
      } else if (e.code == 'wrong-password'){
        print('wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원 로그인"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: _signUp,
                  child: Text(
                      "회원가입"
                  ),
                ),
              ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: _signIn,
                child: Text(
                    "로그인"
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
