import 'package:baljachwi_project/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'Ingredient.dart';
import 'package:baljachwi_project/widgets/db_helper.dart';
import 'package:badges/badges.dart';
class Refrigerator extends StatefulWidget{
  @override
  _Refrigerator createState() => _Refrigerator();
}
class _Refrigerator extends State<Refrigerator> with TickerProviderStateMixin {
  late TabController _tabController;
  var categoryNames = {0:'all',1:'채소',2:'과일.견과.쌀',3:'정육.계란',4:'면.양념.오일'};
  var dbHelper;
  var dbFutre;
  int _ADDselectedIdx=-1;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    dbHelper = IngredientDBHelper();
    dbFutre = _getIngredient();
  }
  Future<Map<int,List<Ingredient>>> _getIngredient() async {
    Map<int,List<Ingredient>> myIngredients = {0:[],1:[],2:[],3:[],4:[]};
    await dbHelper.getAllIngredients().then((value) => value.forEach((element) {
      myIngredients[0]?.add(element);
      myIngredients[element.category]?.add(element);
    }));
    return myIngredients;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffa511),
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          setState(() {
            _ADDselectedIdx = 0;
          });
          showAddIngredientDialog();
        },
        icon: const Icon(Icons.add),
        label:const Text('재료 추가'),
        backgroundColor: const Color(0xffffa511),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('My 냉장고',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                )),
                IconButton(
                    icon: Icon(Icons.help,color: Colors.orange[300]),
                    onPressed: (){
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context){
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('도움말'),
                                  IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close_rounded),color: Colors.grey)
                                ],
                              ),
                                content: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          Divider(),
                                          Chip(
                                              labelPadding: EdgeInsets.all(4),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: const BorderSide(
                                                  color: Color(0xffffa511),
                                                  width: 2.0,
                                                ),
                                              ),
                                              backgroundColor: Color(0xffffa511).withOpacity(0.8),
                                              label: Text('수정 / 삭제', style: TextStyle(color: Colors.black))
                                          ),
                                          SizedBox(height: 15),
                                          Text('해당 재료를 길게 클릭할 시, 수정 or 삭제 버튼이 나타납니다'),
                                    ])
                                )
                            );
                          }
                      );
                    }
                )
              ],
            )
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TabBar(
                indicator: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Color(0xffffa511),width: 3))
                ),
                unselectedLabelStyle: TextStyle(fontSize: 14),
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                isScrollable: true,
                labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                labelColor: const Color(0xffffa511),
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: '채소'),
                  Tab(text: '과일.견과.쌀'),
                  Tab(text: '정육.계란'),
                  Tab(text: '면.양념.오일')
                ]
            )
          ),
          Expanded(
              child:FutureBuilder(
                future: dbFutre,
                builder : (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData== false || snapshot.hasError){
                    return TabBarView(
                      controller: _tabController,
                      children: const [Text('ALL'),Text('채소'),Text('과일.견과.쌀'),Text('정육.계란'),Text('면.양념.오일')]
                    );
                  }
                  else{
                    Map<int,List<Ingredient>> myIngredients = snapshot.data;
                    return Container(
                      color: Colors.grey[100],
                      child:TabBarView(
                          controller: _tabController,
                          children: makeTabview(myIngredients)
                      )
                    );
                  }
                }
              )
          )
        ],
      )
    );
  }

  void showAddIngredientDialog(){
    TextEditingController _nameController = TextEditingController();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('재료 추가'),
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close_rounded))
                ],
              ),
              content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('추가할 재료의 이름을 입력하고, 해당하는 카테고리를 선택해주세요',
                            style: TextStyle(color: Colors.grey)),
                        const Divider(),
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(labelText: '1. 재료 명'),
                        ),
                        const SizedBox(height: 25),
                        const Text('2. category'),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 5.0,
                          children: buildChoiceChip(),
                        ),
                        const SizedBox(height: 30),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            side:const BorderSide(color: Color(0xffffa511), width: 2.0),
                            minimumSize: const Size.fromHeight(50),
                            primary: const Color(0xffffa511),
                            textStyle: const TextStyle(fontWeight: FontWeight.bold)
                          ),
                            onPressed:(){
                            print(_ADDselectedIdx);
                              if(_ADDselectedIdx!=0){
                                submit(_nameController.text,_ADDselectedIdx);
                              }
                            },
                            child: const Text('SUBMIT')
                        )
                      ])
              )
          );
        }
    );
  }
  void submit(String name,int category) async{
    if(name==null || name.length==0){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('재료명을 입력해 주세요')));
      return;
    }
    await dbHelper.insertIngredient(Ingredient(name, category));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('추가 완료')));
    setState((){
      dbFutre = _getIngredient();
    });
    Navigator.pop(context);
  }
  List<Widget> buildChoiceChip(){
    List<ChoiceChip> chips = [];
    for(int i=1; i<categoryNames.length; i++){
      String? _title = categoryNames[i];
      chips.add(
        ChoiceChip(
          label: Text(_title!),
          avatar: const CircleAvatar(backgroundColor: Colors.white),
          padding: const EdgeInsets.all(7),
          selected: _ADDselectedIdx==i,
          onSelected: (bool selected){
            setState(() {
              _ADDselectedIdx = i;
            });
            print(_ADDselectedIdx);
          },
          backgroundColor: Colors.grey[300],
          selectedColor: Color(0xffffa511),
        )
      );
    }
    return chips;
  }
  List<Widget> makeTabview(Map<int,List<Ingredient>> items){
    List<Widget> tainer = [];
    for(int i=0;i<items.length;i++){
      if(items[i]?.length==0){
        tainer.add(Center(child:Text('해당 재료는 없습니다',style:TextStyle(color: Colors.grey))));
      }
      else{
        tainer.add(
            GridView.builder(
                padding: EdgeInsets.fromLTRB(15,30,15,15),
                itemCount: items[i]?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,  // 1개 행
                    mainAxisSpacing: 2,  // 수평 패딩
                    crossAxisSpacing: 2,
                    childAspectRatio: (3/2)
                ),
                itemBuilder: (BuildContext context, int idx) {
                  String itemName = items[i]![idx].name;
                  String? itemCategory = categoryNames[items[i]![idx].category];
                  return InkWell(
                      onLongPress: () async {
                        setState(() {
                          _ADDselectedIdx = 0;
                        });
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(itemName),
                                          SizedBox(width: 10),
                                          Chip(label:Text(itemCategory!),padding: EdgeInsets.all(7)),
                                        ]
                                      ),
                                      IconButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close_rounded))
                                    ],
                                  ),
                                  content: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Divider(),
                                            Wrap(
                                              spacing: 10.0,
                                              runSpacing: 5.0,
                                              children: buildChoiceChip(),
                                            ),
                                            OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                                    ),
                                                    side:const BorderSide(color: Colors.black, width: 2.0),
                                                    minimumSize: const Size.fromHeight(50),
                                                    primary: Colors.black,
                                                    textStyle: const TextStyle(fontWeight: FontWeight.bold)
                                                ),
                                                onPressed:() async{
                                                  items[i]![idx].category = _ADDselectedIdx;
                                                  await dbHelper.updateIngredient(items[i]![idx]);
                                                  setState(() {
                                                    dbFutre = _getIngredient();
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('수정')
                                            ),
                                            const SizedBox(height: 15),
                                            Divider(),
                                            OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                                    ),
                                                    side:const BorderSide(color: Colors.grey, width: 2.0),
                                                    minimumSize: const Size.fromHeight(50),
                                                    primary: Colors.grey,
                                                    textStyle: const TextStyle(fontWeight: FontWeight.bold)
                                                ),
                                                onPressed: () async {
                                                  await dbHelper.deleteIngredient(itemName);
                                                  setState(() {
                                                    dbFutre = _getIngredient();
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('삭제')
                                            )
                                          ])
                                  )
                              );
                            }
                        );
                      },
                      child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset:Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius:0
                                )],
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(itemCategory!,style: TextStyle(color: Colors.grey,fontSize: 10)),
                              SizedBox(height: 10),
                              Center(
                                  child: Text(itemName,style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey
                                  ))
                              )
                            ],
                          )
                      )
                  );
                }
            )
        );
      }
    }
    return tainer;
  }
}
// 1. init에서 ingredient 가져오기    (0)
// 2. container 생성                (0)
// 3. 재료 추가                      (0)
// 4. 재료 삭제 및 수정               (0)