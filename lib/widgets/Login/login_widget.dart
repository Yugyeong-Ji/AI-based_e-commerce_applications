import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '로그인',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black12
              ),
            ),
          ),
          padding:EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: '이메일을 입력해주세요',
                  hintStyle: TextStyle(
                      color: Colors.black12
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black12
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: '비밀번호를 입력해주세요',
                  hintStyle: TextStyle(
                    color: Colors.black12
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.black12
                    ),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  primary: Colors.amber,
                  elevation: 0.0
                ),
                child: Text(
                  '로그인',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                  ),
                ),
                onPressed: signIn,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  primary: Colors.white,
                  elevation: 0.0,
                  side: BorderSide(
                    color: Colors.amber
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: '회원가입',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.amber
                    ),
                  ),
                ),
                onPressed: signIn,
              ),
            ],
          ),
        ),
    );
  }
}
