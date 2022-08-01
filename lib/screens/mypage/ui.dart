import 'package:flutter/material.dart';

Container make_tap(String _tap) {
  return Container(
    height: 50,
    alignment: Alignment.center,
    child: Text(
      _tap,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    ),
  );
}
