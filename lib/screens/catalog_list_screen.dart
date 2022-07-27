import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/catalog_main_screen.dart' as catalog;

bool isChecked = false;
int bigCategory = -1;
List<int> selectCategory = [-1, 0, 10, 20, 30, 40, 50, 60, 70, 80];
class catalogList extends StatefulWidget {
  final String search;
  final int bigCategory;
  const catalogList(this.bigCategory, this.search);

  @override
  State<catalogList> createState() => _catalogList();

}

class Product{
  var name;
  var price;
  var discountRate;
  var regularDelivery;
  var img;
  var category;
}

class _catalogList extends State<catalogList> with TickerProviderStateMixin {
  CollectionReference productCol = FirebaseFirestore.instance.collection('products');
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    selectCategory = catalog.selectCategory;
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
    return Container(
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
                          child: Row(children: [
                            Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    if (value != null) isChecked = value;
                                  });
                                }),
                            Text(
                              '정기구매',
                              style: TextStyle(
                                fontSize: 14,
                                height: 0.95,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1.1,
                    color: Color(0xffb4b7bb),
                  ),
                  FutureBuilder(
                      future: _getProduct(catalog.selectCategory),
                      builder:
                          (BuildContext context, AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          print('------------');
                          print(snapshot);
                          return Text("Something went wrong");
                        }
                        if (!snapshot.hasData) {
                          return Text("Document does not exist");
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<Product> nList = snapshot.data;
                          List<ListTile> mainContainer = [];
                          if (isChecked == false)
                            for(Product doc in nList)
                              mainContainer.add(makeProduct(doc.name,doc.img, doc.price, doc.discountRate, doc.regularDelivery, doc.category, context));
                          else if (isChecked == true)
                            for(Product doc in nList)
                              if (doc.regularDelivery == true)
                                mainContainer.add(makeProduct(doc.name,doc.img, doc.price, doc.discountRate, doc.regularDelivery, doc.category, context));
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
              ),
            ),
          );
  }
}

Future<List<Product>> _getProduct(id) async{
  print(id);
  List<Product> products = [];
  QuerySnapshot<Map<String,dynamic>> querySnapshot;
  if (id == -1) {
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
  else if (id % 10 == 0) {
    for (int doc = id; doc<id+10; doc++) {
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
      querySnapshot = await FirebaseFirestore.instance.collection('products').where('category', isEqualTo: id).get();
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

ListTile makeProduct(String name,String img, int price, int discountRate, bool regularDelivery, int category, BuildContext context){
  var f = NumberFormat('###,###,###,###원');
  return ListTile(
    onTap: (){
      print(name);
    },
    title: Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 110,
                    margin: const EdgeInsets.only(left: 3, right: 15),
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/${img}',
                        width: 100, height: 100),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 202 * (MediaQuery.of(context).size.width/360),
                        height: 5,
                      ),
                      if (regularDelivery == true)
                        Container(
                          width: 202 * (MediaQuery.of(context).size.width/360),
                          margin: const EdgeInsets.only(bottom: 6),
                          alignment: Alignment.centerLeft,
                          child: Image.asset('assets/images/regularDelivery.png',
                              width: 52),
                        ),
                      Container(
                        width: 202 * (MediaQuery.of(context).size.width/360),
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 14),
                        ),
                      ),
                      if (discountRate > 0)
                        Container(
                          width: 202 * (MediaQuery.of(context).size.width/360),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                discountRate.toString()+'%\t',
                                style: TextStyle(fontSize: 14.1, height: 1.6, fontWeight: FontWeight.bold, color:Color(0xffff8511)),
                              ),
                              Text(
                                f.format(price*(100-discountRate)*0.01)+'\t',
                                style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                f.format(price),
                                style: TextStyle(fontSize: 12, height: 1.6, decoration: TextDecoration.lineThrough, color:Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      if (discountRate == 0)
                        Container(
                          width: 202 * (MediaQuery.of(context).size.width/360),
                          child: Text(
                            f.format(price),
                            style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}