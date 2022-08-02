import 'package:flutter/material.dart';
import 'package:baljachwi_project/widgets/foot_bar.dart';
import 'package:baljachwi_project/widgets/nav_bar.dart';
import 'package:baljachwi_project/screens/Home/home_screen.dart';
import 'package:baljachwi_project/screens/mypage/mypage_screen.dart';
import 'package:baljachwi_project/screens/category_screen.dart';
import 'package:baljachwi_project/widgets/user.dart';
class BaseWidget extends StatefulWidget{
  @override
  _BaseWidget createState() => _BaseWidget();
}
User tmp(){
  return User('38231@naver.com','asd','nute11a','01055556666',['133','1333'],0,['BZewREvWvaOGKMhrPvYw']);
}
class _BaseWidget extends State<BaseWidget>{
  int _selectedIndex = 0; // 인덱싱
  final List<Widget> _widgetOptions = <Widget>[
    category(),
    HomeScreen(),
    mypage(tmp()),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1, // 가운데에 있는 홈버튼을 기본값으로 설정
      // vsync: this,  나중에 다른 페이지 연결했을 때 사용
      child: Scaffold(

        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu, size: 18,),
              label: '카테고리'
            ),
            BottomNavigationBarItem(
                icon: Icon( Icons.home, size: 18,),
                label: '홈'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 18,),
                label: '마이 자취'
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xffffa511),
          onTap: _onItemTapped,
        )
      ),
    );
  }
  @override
  void initState() {
    //해당 클래스가 호출되었을떄
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }
}
