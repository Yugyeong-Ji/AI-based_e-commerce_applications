import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/Login/login_my_page_screen.dart';
import 'package:baljachwi_project/screens/Login/sign_in_screen.dart';

class LoginHomeScreen extends StatelessWidget {
  const LoginHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> user){
        // User 의 값이 null 값인지를 확인해서 로그인 유무 구분
        if (user.hasData){
          return LoginMyPageScreen();
        }else{
          return SignInScreen();
        }
        return Container();
        },
    );
  }
}
