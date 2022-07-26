import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginMyPageScreen extends StatelessWidget {
  const LoginMyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 이 페이지로 왔다는 것은 null 값이 아니라는 것이기 때문에 강제추출을 사용해도 무관
                  Text("환영합니다.\n${FirebaseAuth.instance.currentUser!.email}"),
                  ElevatedButton(
                      onPressed: FirebaseAuth.instance.signOut,
                      child: Text("로그아웃")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
