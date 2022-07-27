//import 'dart:js';
//import 'package:meta/meta.dart';
import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'size_config.dart';

final List<String> imgList = [
  'assets/images/함께배송Mate광고1.png',
  'assets/images/함께배송Mate광고2.png'
];

class Home_Mate extends StatefulWidget {
  @override
  _MateContent createState() => _MateContent();
}
class _MateContent extends State<Home_Mate> {
  @override
  Widget build(BuildContext context) {
    return Text('s');
  }
}
/*
class _MateContent extends State<Home_Mate> {
  const _MateContent({
    Key key,
}) : super(key: key);

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
                        ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection('team').snapshots(),
                              builder: (context, snapshot) {
                                if(snapshot.connectionState==ConnectionState.waitng){
                                  return CircularProgressIndicator();
                                }
                                return SizedBox(
                                  height: 130,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (ctx, index) => Container(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          SpecialOfferCard(
                                            img: snapshot.data.docs[index].['img'],
                                            date: snapshot.data.docs[index].['date'],
                                            product: snapshot.data.docs[index].['product'],
                                            participants: snapshot.data.docs[index].['participants'],
                                          )
                                        ],
                                      )
                                    )
                                  ),
                                )
                              },
                            )
                          ],
                        ),
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

class SpecialOfferCard extends StatelessWidget{
  const SpecialOfferCard({
    Key key,
    @required this.product,
    @required this.img,
    @required.this.date,
    @required.this.participants,
  }) : super(key: key);

  final String? product, date, img;
  final double? participants;
@override
Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 20),
    child: GestureDetector(
      child: SizedBox(
        width: 242,
        height: 115,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Image.asset(
              //   image,
              //   fit: BoxFit.cover,
              // ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10,
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "$product\n",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "$date",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}*/