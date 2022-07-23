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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Container(
                // height: 200.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 300,
                            child: Swiper(
                                control: SwiperControl(),
                                pagination: SwiperPagination(),
                                itemCount: imgList.length,
                                itemBuilder: (BuildContext context, int index){
                                  return Image.asset(imgList[index]);
                                }
                                ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0,0, 0, 0),
                        // width: 260,
                        // height: 40,
                        child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                                tabs: [
                                  Container(
                                    height: 25,
                                    alignment: Alignment.center,
                                    child: const Text('전체')
                                  ),
                                  Container(
                                      height: 25,
                                      alignment: Alignment.center,
                                      child: const Text('생필품')
                                  ),
                                  Container(
                                      height: 25,
                                      alignment: Alignment.center,
                                      child: const Text('식재료')
                                  ),
                                  Container(
                                      height: 25,
                                      alignment: Alignment.center,
                                      child: const Text('밀키트')
                                  )
                                  ],
                                  indicator: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Color(0xffffa511),width: 3))
                                  ),
                                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                                  labelColor: Color(0xffffa511),
                                  unselectedLabelColor: Colors.grey,
                                  // controller: _tabController,
                              ),
                            )
                        )

              ]
          ),
                      )
                      ]
                )
              )
          ),
        );
  }
}