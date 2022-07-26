import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parse;
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:beautiful_soup_dart/beautiful_soup.dart';
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