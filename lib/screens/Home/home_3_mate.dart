//import 'package:meta/meta.dart';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<String> imgList = [
  'assets/images/함께배송Mate광고1.png',
  'assets/images/함께배송Mate광고2.png'
];

class Home_Mate extends StatefulWidget {
  @override
  _MateContent createState()=> _MateContent();
}

class _MateContent extends State<Home_Mate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0),
          children: [Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                  children: [
                    Container(
                      //height: 200.0,
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
                                width: MediaQuery.of(context).size.width ,
                                height: 30,
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
                            //Expanded(child:
                            Container(
                              //height: 3000,
                              child: Column(
                                children: [
                                  SizedBox(height: 5),
                                  StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection('team').snapshots(),
                                    builder: (context, snapshot) {
                                      if(snapshot.connectionState==ConnectionState.waiting){
                                        return CircularProgressIndicator();
                                      }
                                      return SizedBox(
                                        //height: 1500,
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (ctx, index) => Container(
                                                padding: EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    SpecialOfferCard(
                                                      image: snapshot.data!.docs[index]['img'],
                                                      date: snapshot.data!.docs[index]['date'],
                                                      products: snapshot.data!.docs[index]['product'],
                                                      participants: snapshot.data!.docs[index]['participants'],
                                                    ),
                                                  ],
                                                )
                                            )
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                            //   )
                          ]
                      ),
                    )

                  ]
              )
          )
    ]
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {

  final int? participants;
  final String? products;
  final String? date;
  final String? image;

  SpecialOfferCard({
    @required this.products,
    @required this.date,
    @required this.image,
    @required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  "$image",
                  // fit: BoxFit.cover,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffffcd7d),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
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
                          text: "$products",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: "  현재 $participants명 참여\n",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black45,
                            )
                        ),
                        TextSpan(
                          text: "\n$date 배송예정",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
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
      );
  }
}