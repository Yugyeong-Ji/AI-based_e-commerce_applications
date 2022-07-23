import 'package:flutter/material.dart';

class Footbar extends StatelessWidget {
  const Footbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Container(
        height: 70,
        child: TabBar(
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent,
          tabs: const <Widget>[
            Tab(
              icon: Icon(
                Icons.menu,
                size: 18,
              ),
              child: Text(
                '카테고리',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.home,
                size: 18,
              ),
              child: Text(
                '홈',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person_outline,
                size: 18,
              ),
              child: Text(
                '마이자취',
                style: TextStyle(fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}