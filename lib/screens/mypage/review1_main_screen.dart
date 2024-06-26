import 'package:baljachwi_project/screens/mypage/review2_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/review2_write_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int index = 0;

class review extends StatefulWidget {
  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: makeAppBar(context, '리뷰'),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: TabBar(
                indicatorColor: Color(0xffffa511),
                labelColor: Color(0xffffa511),
                unselectedLabelColor: Color(0xffa6a6a6),
                unselectedLabelStyle: TextStyle(
                  decoration: TextDecoration.none,
                ),
                tabs: [
                  makeTap('리뷰 작성'),
                  makeTap('내 리뷰'),
                ],
              ),
            ),
            Container(height: 2, color: Color(0xffd9d9d9)),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        color: Color(0xfff2f2f2),
                        child: FutureBuilder(
                            future: getReviewableOrder(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return const Text("Something went wrong");
                              }
                              if (!snapshot.hasData) {
                                return const Text("불러오는 중..");
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                List<Order> qList = snapshot.data;

                                List<Container> mainContainer = [];
                                for (Order doc in qList) {
                                  mainContainer.add(makeReviewableProducts(
                                      context,
                                      doc.company,
                                      doc.product,
                                      doc.orderNumber));
                                }
                                return Container(
                                    child: Column(
                                        children: mainContainer.toList()));
                              }
                              return const Text("불러오는 중..");
                            }),
                      ),
                    ),
                    SingleChildScrollView(
                      child: FutureBuilder(
                          future: getReview(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }
                            if (!snapshot.hasData) {
                              return const Text("불러오는 중..");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              List<Review> qList = snapshot.data;

                              List<Container> mainContainer = [];
                              for (Review doc in qList) {
                                mainContainer.add(makeMyReview(
                                    context,
                                    doc.orderNumber.toString(),
                                    doc.company,
                                    doc.product,
                                    doc.stars,
                                    doc.content));
                              }
                              return Container(
                                  child:
                                      Column(children: mainContainer.toList()));
                            }
                            return const Text("불러오는 중..");
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Order>> getReviewableOrder() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('orderHistory');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.where('state', isEqualTo: '주문 완료').get();
  List<Order> order = [];
  for (var doc in querySnapshot.docs) {
    Order tmp = Order();
    tmp.company = doc['company'];
    tmp.product = doc['product'];
    tmp.orderNumber = doc['orderNumber'];
    order.add(tmp);
  }
  return order;
}

Future<List<Review>> getReview() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('review');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<Review> R = [];
  for (var doc in querySnapshot.docs) {
    Review tmp = Review();
    tmp.orderNumber = doc['orderNumber'];
    tmp.stars = doc['stars'];
    tmp.company = doc['company'];
    tmp.product = doc['product'];
    tmp.content = doc['content'];
    R.add(tmp);
  }
  return R;
}

Container makeReviewableProducts(
    BuildContext context, String company, String product, int orderNumber) {
  return Container(
    child: Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              company,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffa6a6a6),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              product,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xfff2f2f2),
                        border: Border.all(
                          width: 1,
                          color: Color(0xffd9d9d9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 45,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            writeReview(company, product, orderNumber),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 0,
                    primary: const Color(0xffffa511),
                  ),
                  child: const Text(
                    '리뷰 쓰기',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(height: 2, color: Color(0xffd9d9d9)),
      ],
    ),
  );
}

Container makeMyReview(BuildContext context, String orderNumber, String company,
    String productName, var stars, String content) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              company,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffa6a6a6),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              productName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xfff2f2f2),
                        border: Border.all(
                          width: 1,
                          color: Color(0xffd9d9d9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10),
                child: Row(
                  children: makeStar(stars),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  content,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  ' 더보기 >',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(height: 15),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        child: TextButton(
                          child: Text('수정',
                              style: TextStyle(
                                color: Color(0xffa6a6a6),
                              )),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                width: 2,
                                color: Color(
                                  0xffa6a6a6,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => editReview(company,
                                    productName, orderNumber, stars, content),
                              ),
                            );
                          },
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      child: TextButton(
                        child: Text('삭제',
                            style: TextStyle(
                              color: Color(0xffa6a6a6),
                            )),
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              width: 2,
                              color: Color(0xffa6a6a6),
                            ),
                          ),
                        ),
                        onPressed: () {
                          deletedata(context, orderNumber);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(height: 2, color: Color(0xffd9d9d9)),
      ],
    ),
  );
}

List<Widget> makeStar(var s) {
  List<Widget> Stars = [];
  for (var i = 0; i < s + 1; i++) {
    Stars.add(Icon(
      Icons.star,
      color: Color(0xffffa511),
      size: 20,
    ));
  }
  return Stars;
}

void deletedata(BuildContext context, String name) {
  FirebaseFirestore.instance
      .collection("review")
      .doc(name)
      .delete()
      .then((value) => makeDialog(context, '리뷰가 삭제되었습니다.'));
}
