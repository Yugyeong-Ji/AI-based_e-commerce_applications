import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart'; //폰트들은 임의로 설정했음.나중에 변경할 예정
import 'product.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  //final bool? lineChange;
  //final double? textContainerHeight;
  final String? order;
  const ProductItem({this.order});
/*
  const ProductItem(
      {Key? key,
      this.lineChange = false,
      this.textContainerHeight = 80
      })
      : super(key: key);
*/
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: FutureBuilder(
                    future: getProduct(order:order),
                    builder:
                        (BuildContext context, AsyncSnapshot snapshot){
                      if (snapshot.hasError) {
                        print(snapshot);
                        return Text("Something went wrong");
                      }
                      if (!snapshot.hasData) {
                        return Text("Document does not exist");
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Product> nList = snapshot.data;
                        List<Container> mainContainer = [];
                        for(Product doc in nList) {
                          mainContainer.add(
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Image.asset('assets/images/${doc.thumbnail}',
                                            width: 130, height: 130),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 120,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                                text: "${doc.name}\n",
                                                style: GoogleFonts.nanumGothic(
                                                    fontSize: 14.0)),
                                            TextSpan(
                                                text: "${doc.discountRate}%",
                                                style: GoogleFonts.nanumGothic(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                    color: Colors.red)),
                                            TextSpan(
                                                text: discountPrice(
                                                    doc.price,
                                                    doc.discountRate),
                                                style: GoogleFonts.nanumGothic(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0)),
                                            TextSpan(
                                              text: "${doc.price.toString()
                                                  .numberFormat()}원",
                                              style: GoogleFonts.nanumGothic(
                                                fontSize: 13.0,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          );
                        }
                        return ListView(
                            scrollDirection: Axis.horizontal,
                            children: mainContainer.toList()
                        );
                      }
                      return Text('roading');
                    }
                ),
    );
  }

  String discountPrice(int price, int discountRate) {
    double doubleDiscountRate = ((100 - discountRate) / 100);
    int discountPrice = (price * doubleDiscountRate).toInt();
    return "${discountPrice.toString().numberFormat()}원";
  }
}

Future<List<Product>> getProduct({String? order}) async{
  List<Product> products = [];
  QuerySnapshot<Map<String,dynamic>> querySnapshot;
  if (order == 'new') querySnapshot = await FirebaseFirestore.instance.collection("products").orderBy("uploadDate", descending: true).get();
  else querySnapshot = await FirebaseFirestore.instance.collection("products").get();
  for(var doc in querySnapshot.docs){
    Product tmp = Product(
        uploadDate : DateTime.parse(doc['uploadDate'].toDate().toString()),
        name : doc['name'],
        category : doc['category'],
        price : doc['price'],
        discountRate : doc['discountRate'],
        thumbnail : doc['img'],
        regularDelivery : doc['regularDelivery'],
      );
      products.add(tmp);
    }
  return products;
}

extension StringExtension on String {
  String numberFormat() {
    final formatter = NumberFormat("#,###");
    return formatter.format(int.parse(this));
  }
}
