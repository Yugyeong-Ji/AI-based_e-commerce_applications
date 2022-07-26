import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/Login/login_home_screen.dart';

class LoginAppScreen extends StatelessWidget {
  LoginAppScreen({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initalization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initalization,
        builder: (context, snapshot){
          // 로드가 실패했을 때
          if(snapshot.hasError){
            return Text("파이어베이스 init 실패!");
          }
          // 정상적으로 로그인 처리가 되었을 때
          if(snapshot.connectionState == ConnectionState.done){
            return LoginHomeScreen();
          }
          // 로딩처리
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
