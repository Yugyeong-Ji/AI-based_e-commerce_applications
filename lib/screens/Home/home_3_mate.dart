import 'package:flutter/material.dart';
class Home_Mate extends StatefulWidget {
  @override
  _Mate createState() => _Mate();
}

class _Mate extends State<Home_Mate>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('자취 추천'),
        ),
      ),
    );
  }
}