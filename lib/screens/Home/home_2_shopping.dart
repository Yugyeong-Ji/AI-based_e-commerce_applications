import 'package:flutter/material.dart';
class Home_Shopping extends StatefulWidget {
  @override
  _Shopping createState() => _Shopping();
}
class _Shopping extends State<Home_Shopping>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('자취 추천')
        ),
      ),
    );
  }
}