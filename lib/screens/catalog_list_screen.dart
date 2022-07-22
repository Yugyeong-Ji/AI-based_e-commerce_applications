import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

bool isChecked = false;

class catalogList extends StatefulWidget {
  const catalogList({Key? key}) : super(key: key);
  @override
  State<catalogList> createState() => _catalogList();
}

class Product{
  var name;
  var price;
  var discountRate;
  var regularDelivery;
  var img;
}

class _catalogList extends State<catalogList> {
  CollectionReference productCol = FirebaseFirestore.instance.collection('products');
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '상품 목록',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Color(0xffffa511),
          iconSize: 30,
          onPressed: () {
            //Navigator.pop(context);
            print('BackPage');
          }, // 페이지 연결
        ),
        actions: <Widget>[
          Expanded(
            child: Container(
              height: 50,
              child: TextField(
                controller: _controller,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xffa6a6a6),
                    ),
                  ),
                  labelText: '내용을 입력해주세요.',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: _clearTextField,
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              padding: const EdgeInsets.only(right: 5, left:53, top:10, bottom:7),
            ),
          ),
          IconButton(
            icon: Icon(Icons.room), // 아이콘 생성
            color: Color(0xffffa511),
            onPressed: () {
              // 아이콘 버튼 실행
              print('Button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart), // 장바구니 아이콘 생성
            color: Color(0xffffa511),
            onPressed: () {
              // 아이콘 버튼 실행
              print('Shopping cart button is clicked');
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
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
            height: 1.2,
            color: Color(0xffb4b7bb),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  FutureBuilder(
                      future: _getProduct(),
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
                          List<ListTile> mainContainer = [];
                          for(Product doc in nList)
                            mainContainer.add(makeProduct(doc.name,doc.img, doc.price, doc.discountRate, doc.regularDelivery, context));
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
          ),
        ],
      ),
    );
  }
}

Future<List<Product>> _getProduct() async{
  CollectionReference<Map<String,dynamic>> collectionReference = FirebaseFirestore.instance.collection('products');
  QuerySnapshot<Map<String,dynamic>> querySnapshot = await collectionReference.get();
  List<Product> products = [];
  for(var doc in querySnapshot.docs){
    Product tmp = Product();
    tmp.name = doc['name'];
    tmp.img = doc['img'];
    tmp.price = doc['price'];
    tmp.discountRate = doc['discountRate'];
    tmp.regularDelivery = doc['regularDelivery'];
    products.add(tmp);
  }
  return products;
}


ListTile makeProduct(String name,String img, int price, int discountRate, bool regularDelivery, BuildContext context){
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
                                f.format(price)+'\t',
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