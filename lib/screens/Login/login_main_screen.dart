import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/widgets/Login/login_widget.dart';
import 'package:baljachwi_project/screens/Login/login_home_screen.dart';
import 'package:baljachwi_project/widgets/Login/auth_page_widget.dart';

class LoginMainScreen extends StatelessWidget {
  const LoginMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError){
            return Center(child: Text('Something went'));
          } else if (snapshot.hasData){
            return HomePage();
          }else{
            return AuthPage();
          }
        },
      ),
    );
  }
}
