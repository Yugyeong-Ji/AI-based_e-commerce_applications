import 'package:flutter/material.dart';
import 'package:baljachwi_project/widgets/foot_bar.dart';
import 'package:baljachwi_project/widgets/nav_bar.dart';
import 'package:baljachwi_project/screens/Home/home_1_main.dart';
import 'package:baljachwi_project/screens/Home/home_2_shopping.dart';
import 'package:baljachwi_project/screens/Home/home_3_mate.dart';
import 'package:baljachwi_project/screens/Home/home_4_recipe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Navbar(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TabBar(
              tabs: [
                Container(
                  height: 35,
                  alignment: Alignment.center,
                  child: const Text('자취 추천')
                ),
                Container(
                  height: 35,
                  alignment: Alignment.center,
                  child: const Text('쇼핑')
                ),
                Container(
                  height: 35,
                  alignment: Alignment.center,
                  child: const Text('mate')
                ),
                Container(
                  height: 35,
                  alignment: Alignment.center,
                  child:  const Text('레시피')
                )
              ],
              indicator: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xffffa511),width: 3))
              ),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              labelColor: Color(0xffffa511),
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Home_Main(),
                Home_Shopping(),
                Home_Shopping(),
                //Home_Mate(),
                Home_Recipe()
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}


