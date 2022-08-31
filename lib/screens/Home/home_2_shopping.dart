import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/product.dart';
import '../../widgets/product_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart' as parse;
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'dart:async';



class Product{
  var name;
  var price;
  var discountRate;
  var regularDelivery;
  var img;
  var category;
}
bool isChecked = false;
int bigCategory = -1;
String search = '';
List<int> selectCategory = [-1, 0, 10, 20, 30, 40, 50, 60, 70];



class Home_Shopping extends StatefulWidget {
  // get bigCategory => null;


  @override
  _Shopping createState() => _Shopping();
}

class _Shopping extends State<Home_Shopping> with TickerProviderStateMixin{
  CollectionReference productCol = FirebaseFirestore.instance.collection('products');
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    var catalog;
    //selectCategory = catalog.selectCategory;
    //bigCategory = widget.bigCategory+1;
    search = widget as String;
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
      length: 0,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
  }

  final TextEditingController _controller = TextEditingController();
  void _clearTextField() {
    // Clear everything in the text field
    _controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var catalog;
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Best",
                  style: GoogleFonts.nanumGothic(
                      fontSize: 18.0, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: const Text("See All",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 300,
          width: double.infinity,
          child: ProductItem(),
        ),

        Container(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 33,
                    padding: const EdgeInsets.all(2.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 14,
                          margin: const EdgeInsets.only(left: 3, top:3.5),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
        FutureBuilder(
            future: _getProduct(catalog.selectCategory),
            builder:
                (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasError) {
                //print(snapshot);
                return Text("Something went wrong");
              }
              if (!snapshot.hasData) {
                return Text("Document does not exist");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                List<Product> nList = snapshot.data;
                List<ListTile> mainContainer = [];
                if (isChecked == false)
                  for(Product doc in nList) {
                    if (doc.name.contains(widget as String)) {
                      mainContainer.add(makeProduct(doc.name,doc.img, doc.price, doc.discountRate, doc.regularDelivery, doc.category, context));
                    }
                  }
                else if (isChecked == true)
                  for(Product doc in nList) {
                    if (doc.regularDelivery == true && doc.name.contains(widget as String)) {
                      mainContainer.add(makeProduct(doc.name,doc.img, doc.price, doc.discountRate, doc.regularDelivery, doc.category, context));
                    }
                  }
                return Container(
                  child: Column(
                    children: mainContainer.toList(),
                  ),
                );
              }
              return Text('roading');
            }
        )


      ],
    );
  }
  Future<List<Product>> _getProduct(List<int> id) async{
    int thisCat = id[bigCategory];
    List<Product> products = [];
    QuerySnapshot<Map<String,dynamic>> querySnapshot;
    if (thisCat == -1) {
      querySnapshot = await FirebaseFirestore.instance.collection('products').get();
      for(var doc in querySnapshot.docs){
        Product tmp = Product();
        tmp.name = doc['name'];
        tmp.img = doc['img'];
        tmp.price = doc['price'];
        tmp.discountRate = doc['discountRate'];
        tmp.regularDelivery = doc['regularDelivery'];
        tmp.category = doc['category'];
        products.add(tmp);
      }
    }
    else if (id[bigCategory] % 10 == 0) {
      for (int doc = thisCat; doc<thisCat+10; doc++) {
        querySnapshot = await FirebaseFirestore.instance.collection('products').where('category', isEqualTo: doc).get();
        for (var doc in querySnapshot.docs) {
          Product tmp = Product();
          tmp.name = doc['name'];
          tmp.img = doc['img'];
          tmp.price = doc['price'];
          tmp.discountRate = doc['discountRate'];
          tmp.regularDelivery = doc['regularDelivery'];
          tmp.category = doc['category'];
          products.add(tmp);
        }
      }
    }
    else {
      querySnapshot = await FirebaseFirestore.instance.collection('products').where('category', isEqualTo: id[bigCategory]).get();
      for (var doc in querySnapshot.docs) {
        Product tmp = Product();
        tmp.name = doc['name'];
        tmp.img = doc['img'];
        tmp.price = doc['price'];
        tmp.discountRate = doc['discountRate'];
        tmp.regularDelivery = doc['regularDelivery'];
        tmp.category = doc['category'];
        products.add(tmp);
      }
    }
    return products;
  }


  makeProduct(   dynamic name,   dynamic img,   dynamic price,   dynamic discountRate,   dynamic regularDelivery,   dynamic category,   BuildContext context, )
  {

  }

}

