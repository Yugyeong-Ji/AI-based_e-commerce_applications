import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baljachwi_project/screens/catalog_list_screen.dart';


bool isChecked = false;
List<int> selectCategory = [-1, 0, 10, 20, 30, 40, 50, 60, 70];
String search = '';

class catalogMain extends StatefulWidget {
  const catalogMain({Key? key}) : super(key: key);
  @override
  State<catalogMain> createState() => _catalogMain();
}

class Product{
  var name;
  var price;
  var discountRate;
  var regularDelivery;
  var img;
  var category;
}

class _catalogMain extends State<catalogMain> with TickerProviderStateMixin {
  CollectionReference productCol = FirebaseFirestore.instance.collection('products');
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
      length: 9,
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
      body:
      Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TabBar(
              isScrollable: true,
              tabs: [
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: const Text('전체')
                ),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: const Text('채소·과일')
                ),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: const Text('정육·계란')
                ),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: const Text('수산·해산·건어물')
                ),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: const Text('국·메인요리·반찬·밀키트')
                ),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child:  const Text('샐러드·간편식')
                ),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: const Text('면·소스·오일')
                ),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: const Text('주방용품')
                ),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: const Text('생활용품')
                ),
              ],
              indicator: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xffffa511),width: 3))
              ),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              labelColor: Color(0xffffa511),
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                for(int i=-1; i<8; i++)
                  header(i, context)
              ],
            ),
          ),
        ],
      ),

    );
  }

  List<String> selectedCategory = ['전체', '전체', '전체', '전체', '전체', '전체', '전체', '전체'];
  List<List<String>> smallCategory = [
    ['전체', '양파·파·마늘·고추', '뿌리채소', '쌈채소', '샐러드채소', '콩나물·버섯', '이색·냉동채소'],
    ['전체', '소고기', '돼지고기', '닭·오리고기', '계란류', '양념·가공육', '기타고기'],
    ['전체', '생선류', '반건조', '갑각류', '해산물·조개류', '수산가공품', '건어물·다시팩'],
    ['전체', '국·탕·찌개', '밀키트', '반찬류', '김치·젓갈류', '햄·통조림', '두부·부침개'],
    ['전체', '샐러드·다이어트 식품', '도시락', '분식·냉동식품', '카레·스프류', '시리얼'],
    ['전체', '면류', '소스·드레싱', '양념·장류', '오일', '소금·설탕·분말류', '밀가루·가루'],
    ['전체', '소모품·일회용품', '보관용기·텀블러', '주방도구·냄비·팬'],
    ['전체', '세제·청소용품', '화장지·물티슈·위생용품', '생활잡화', '마스크·의약외품']
  ];

  Widget header(int category, BuildContext context){
    if (category == -1) {return catalogList(-1, 'context');}
    else {
      return Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 4.0, left: 0.0, right: 0.0, bottom: 6.0),
                        child: Container(
                          child: Center(
                            child: Column(
                                children: <Widget>[
                                  SizedBox(height: 4.0),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        for(String that in smallCategory[category])
                                          Column(
                                            children: [
                                              SizedBox(width: 2.0,),
                                              InkWell(
                                                highlightColor: Colors.transparent,
                                                splashColor: Colors.transparent,
                                                onTap: () {
                                                  selectedCategory[category] = that;
                                                    selectCategory[category+1] =
                                                      category * 10 +
                                                          smallCategory[category]
                                                              .indexOf(that);
                                                    setState(() {});
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 6.0),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 11.0, horizontal: 12.0),
                                                  decoration: BoxDecoration(
                                                    color: selectedCategory[category] == that
                                                        ? Colors.orange[100]
                                                        : Colors.grey[200],
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(48.0)),
                                                  ),
                                                  child: Text(that,
                                                    style: TextStyle(
                                                        color: Colors.grey[900],
                                                        fontSize: 10.5,
                                                        fontWeight: FontWeight.w500),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        SizedBox(height: 6.0,),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        )),
              ],
            ),
          ),
          catalogList(category, ''),
        ],
      );
    }
  }
}