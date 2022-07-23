import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
final List<String> imgList = [
  'assets/images/함께배송Mate광고1.png',
  'assets/images/함께배송Mate광고2.png'
];

class Home_Mate extends StatefulWidget {
  @override
  _MateSlider createState() => _MateSlider();
}
class _MateSlider extends State<Home_Mate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      )
    );
  }
}