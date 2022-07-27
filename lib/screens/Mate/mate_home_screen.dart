import 'package:flutter/material.dart';
//import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:baljachwi_project/widgets/foot_bar.dart';
import 'package:baljachwi_project/widgets/nav_bar.dart';
import 'package:card_swiper/card_swiper.dart';
class mateHomeScreen extends StatelessWidget {
  const mateHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1, // 가운데에 있는 홈버튼을 기본값으로 설정
      // vsync: this,  나중에 다른 페이지 연결했을 때 사용
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Navbar(),
        ),
        body: MateImg(),
        bottomNavigationBar: Footbar(),
      ),
    );
  }
}

final List<String> imgList = [
'assets/images/함께배송Mate광고1.png',
'assets/images/함께배송Mate광고2.png'
];

class MateImg extends StatefulWidget {
  MateImg({Key? key}) : super(key: key);

  @override
  _MateSlider createState() => _MateSlider();
}

class _MateSlider extends State<MateImg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Swiper(
          control: SwiperControl(),
          pagination: SwiperPagination(),
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index){
            return Image.network(imgList[index]);
          }
        ),
      ),
    );
  }
}