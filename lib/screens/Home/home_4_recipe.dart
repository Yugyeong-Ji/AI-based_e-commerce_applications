import 'dart:convert';

import 'package:baljachwi_project/widgets/Ingredient.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as parse;
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:card_swiper/card_swiper.dart';
import '../../widgets/db_helper.dart';
import '../../widgets/recipeDbHelper.dart';
import 'package:baljachwi_project/widgets/Recipe.dart';

class Home_Recipe extends StatefulWidget {
  @override
  _Recipe createState()=> _Recipe();
}

class _Recipe extends State<Home_Recipe> with TickerProviderStateMixin{

  var top10Future;  // 실시간 인기레시피를 불러오기 위한 Future 변수
  var recommandIngredientFuture;  // 재료추천을 위한 Future 변수
  final searchRecipe=null;
  final _searchRecipeController = TextEditingController();
  final _searchIngredientController = TextEditingController();
  bool _showRecipe = true;
  // 2. 레시피 추천 변수들
  var dbHelper;
  var recipeDBHelper; // recipe.db에 연결하는 helper
  var localDbFuture;
  var categoryNames = {0:'all',1:'채소',2:'과일.견과.쌀',3:'정육.계란',4:'면.양념.오일'};
  late List<Ingredient> ingredients;
  List<String> _selectedIngredient = [];   // 선택한 재료 담은 list 변수
  final List<String> maximum = ['~10,000','~30,000','~50,000','~100,000','무제한'];
  int _selectedMaximum=-1;
  var recommandedRecipeFuture;
  // 0. TOP10 뽑는 메소드
  Future<List<InkWell>> _getTop10() async {
    List<InkWell> tmpTop = [];
    http.Response response = await http.get(Uri.parse('https://www.10000recipe.com/index.html'));
    dom.Document document = parse.parse(response.body);
    var t = document.getElementById('CarrouselBox3');
    if(t==null) return [];
    var boxes = t.getElementsByClassName('common_sp_list_li');
    for(var i=0;i<10;i++){
      var path = 'https://www.10000recipe.com${boxes[i].getElementsByTagName('a')[0].attributes['href']}';
      var imgP = boxes[i].getElementsByTagName('img')[0].attributes['src'].toString();
      tmpTop.add(
          InkWell(
              onTap: () async => launchUrl(Uri.parse(path)),
              child:
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imgP,fit: BoxFit.fill,height: 150)
              )
          )
      );
    }
   return tmpTop;
  }
  // 1. 재료 검색 메소드
  Future<Recipe> _getRecipe(recipeName) async{
    // (1) 레시피 검색
    print('call _getRecipe'+recipeName);
    var response = await http.get(Uri.parse('https://www.10000recipe.com/recipe/list.html?q=$recipeName'));
    dom.Document document = parse.parse(response.body);
    var isNone = document.getElementsByClassName('result_none');
    if(isNone.length!=0){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(recipeName+"에 대한 검색결과가 없습니다.")));
      setState(() =>_showRecipe = true);
      return Recipe('NONE','NONE', []);
    }else{
      print('\'$recipeName\' 레시피 존재');
    }
    var ul = document.getElementsByClassName('common_sp_list_ul');
    var li = ul[ul.length-1].getElementsByClassName('common_sp_list_li');
    String path = li[0].getElementsByClassName('common_sp_thumb')[0].getElementsByTagName('a')[0].attributes['href'].toString();
    path = 'https://www.10000recipe.com$path';
    // (2) 재료 검색 & 추출
    var ingredient = [];
    response = await http.get(Uri.parse(path));
    document = parse.parse(response.body);
    // imgPath
    var img = (document.getElementsByClassName('centeredcrop')[0]).getElementsByTagName('img')[0].attributes['src'];
    // title
    var title = (document.getElementsByClassName('view2_summary st3')[0]).getElementsByTagName('h3')[0].innerHtml;
    print(title);
    // ingredient
    var res = document.getElementsByClassName('ready_ingre3')[0];
    for(var ul in res.getElementsByTagName('ul')){
      if(ul.getElementsByTagName('b')[0].innerHtml.contains('재료')){
        // 재료부분 가져오기!
        for(var li in ul.getElementsByTagName('li')){
          String tmpIngredient;
          var tmp = li.getElementsByTagName('a');
          if(tmp==null || tmp.length==0){
            tmpIngredient = li.innerHtml;
            tmpIngredient = tmpIngredient.toString().substring(0,tmpIngredient.indexOf('<span')).trim();
          }
          else{
            tmpIngredient = tmp[0].innerHtml;
            tmpIngredient = tmpIngredient.substring(0,tmpIngredient.indexOf('<img')).trim();
          }
          ingredient.add(tmpIngredient);
        }
      }
    }
    print(title.toString()+img.toString());
    print(ingredient);
    return Recipe(title,img,ingredient);
  }
  // 2. 냉장고 속 재료 가져오기
  Future<void> _getIngredientDB() async{
    ingredients = await dbHelper.getAllIngredients();
  }
  late TabController _recommandController;
  @override
  void initState(){
    super.initState();
    _recommandController = TabController(
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    top10Future = _getTop10();
    dbHelper = IngredientDBHelper();
    recipeDBHelper = RecipeDBHelper();
    localDbFuture = _getIngredientDB();//ingredients = _getIngredientDB(); // local db 불러오기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Container(
              padding: const EdgeInsets.fromLTRB(0,20, 0,0),
              child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('실시간 인기 레시피',style: TextStyle(fontWeight: FontWeight.bold),),
                          const Divider(thickness: 0.5,color: Colors.white),
                          FutureBuilder(
                              future: top10Future,
                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData == false) {
                                  return const SizedBox(
                                    height: 180,
                                  );
                                }
                                else if (snapshot.hasError) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Error: ${snapshot.error}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  );
                                }
                                else{
                                  return SizedBox(
                                      height: 200,
                                    child: Swiper(
                                      itemBuilder: (BuildContext context,int idx){
                                        return snapshot.data[idx];
                                      },
                                      itemCount: 10,
                                      pagination: const SwiperPagination(
                                          builder: DotSwiperPaginationBuilder(
                                              color: Colors.grey,
                                              activeColor: Color(0xffffa511)
                                          )
                                      ),
                                      control: const SwiperControl(
                                          color: Color(0xffffa511)
                                      ),
                                      //autoplay: true,
                                      //duration: 1,
                                    )
                                  );
                                }
                              }
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0,30, 0, 100),
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('재료 추천',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[850],fontSize: 18)),
                                        IconButton(onPressed: ()=>showHelpDialog(0), icon: Icon(Icons.help,color: Colors.orange[100]))
                                      ],
                                    ),
                                    Divider(thickness: 3,color: Colors.grey[850]),
                                    const Text('필요한 재료를 알려드립니다!',style: TextStyle(color: Colors.grey))
                                  ]
                              )
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                              child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                        controller: _searchRecipeController,
                                        onSubmitted: _handleSubmitted,
                                        decoration: const InputDecoration.collapsed(
                                            hintText: "레시피를 입력해주세요"),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                      child: IconButton(
                                          icon: const Icon(Icons.search),
                                          onPressed: ()=> _handleSubmitted(_searchRecipeController.text)),
                                    )
                                  ]
                              )
                          ),
                          Offstage(
                              offstage: _showRecipe,
                              child:FutureBuilder(
                                  future: recommandIngredientFuture,
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData == false) {
                                      return const Center(child: Text('ROADING..'));
                                    }
                                    else{
                                      Recipe r = snapshot.data;
                                      if(r.title=='NONE'){
                                        return Center();
                                      }
                                      return Container(
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                  alignment: Alignment.centerRight,
                                                  child: IconButton(
                                                      onPressed: ()=>setState(() {
                                                        _showRecipe = true;
                                                      }),
                                                      icon: Icon(Icons.close_rounded),color: Colors.grey)
                                              ),
                                              Image.network(r.imgPath,fit:BoxFit.fitWidth,height: 100),
                                              SizedBox(height: 10),
                                              Text(r.title,textAlign:TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [Text('재료 ',style: TextStyle(fontWeight: FontWeight.bold)),Text('Ingredients',style: TextStyle(color: Colors.grey[400]))],
                                              ),
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: (r.ingredient).length,
                                                  itemBuilder: (BuildContext context,int idx){
                                                    return makeIngredient_con(r.ingredient[idx]);
                                                  }
                                              )
                                            ],
                                          )
                                      );
                                    }
                                  }
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('레시피 추천',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[850],fontSize: 18)),
                              IconButton(onPressed: ()=>showHelpDialog(1), icon: Icon(Icons.help,color: Colors.orange[100]))
                            ],
                          ),
                          const Text('보유중인 재료에 맞는 레시피를 추천해 드립니다!',style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 70,
                            child:ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: maximum.length,
                                itemBuilder: (context,index){
                                  return Container(
                                      margin: const EdgeInsets.all(5),
                                      padding: const EdgeInsets.all(5),
                                      child: ChoiceChip(
                                          label: Text(maximum[index]),
                                          selected: _selectedMaximum==index,
                                          onSelected: (bool selected){
                                            setState(() {
                                              _selectedMaximum = index;
                                            });
                                          },
                                          backgroundColor: Colors.grey[300],
                                          selectedColor: Colors.orange
                                      )
                                  );
                                }
                            ),
                          ),
                          FutureBuilder(
                            future: localDbFuture,
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return CircularProgressIndicator(color:Colors.grey); // CircularProgressIndicator : 로딩 에니메이션
                              }
                              else{
                                return Container(
                                    height: 250,
                                    child: GridView.builder(
                                      itemCount: ingredients.length,
                                      scrollDirection: Axis.horizontal,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 4.0,
                                          crossAxisSpacing: 8.0,
                                          childAspectRatio: 3/5
                                      ),
                                      itemBuilder: (context,i){
                                        String? itemCategory = categoryNames[ingredients[i].category];
                                        return InkWell(
                                            onTap:(){
                                              if(_selectedIngredient.contains(ingredients[i].name)){
                                                setState(() {
                                                  _selectedIngredient.remove(ingredients[i].name);
                                                });
                                              }
                                              else{
                                                setState(() {
                                                  _selectedIngredient.add(ingredients[i].name);
                                                });
                                              }
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.all(3),
                                                padding: const EdgeInsets.all(10),
                                                width : 50,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey.withOpacity(0.2),
                                                          offset:const Offset(0, 5),
                                                          blurRadius: 5.0,
                                                          spreadRadius:0
                                                      )],
                                                    color: _selectedIngredient.contains(ingredients[i].name) ? Colors.orange : Colors.white,
                                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text( itemCategory!,
                                                        style: TextStyle(
                                                            color: _selectedIngredient.contains(ingredients[i].name) ? Colors.white : Colors.grey[850],
                                                            fontSize: 10)),
                                                    const SizedBox(height: 10),
                                                    Center(
                                                        child: Text(ingredients[i].name,
                                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,
                                                                color: _selectedIngredient.contains(ingredients[i].name) ? Colors.white : Colors.grey[850])
                                                        ))
                                                  ],
                                                )
                                            )
                                        );
                                      },
                                    )
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 40),
                          OutlinedButton(
                              onPressed: (){ recommandedRecipeFuture= _getRecommandRecipe(); },    // 레시피 추천 함수
                              style: OutlinedButton.styleFrom(
                                  elevation: 1,
                                  backgroundColor: Colors.white,
                                  //side:BorderSide(color: Colors.grey,width:1),
                                  padding: const EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.search,color: Colors.black),
                                  SizedBox(width: 5),
                                  Text('선택한 재료 조합으로 메뉴 검색',style: TextStyle(color: Colors.black))
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    FutureBuilder(
                      future: recommandedRecipeFuture,
                      builder: (BuildContext context,AsyncSnapshot snapshot){
                        if(snapshot.hasData==false || snapshot.hasError){
                          print('NOP');
                          return Container();
                        }
                        else{
                          print('YES');
                          List<dynamic> datas = snapshot.data;
                          return Container(
                            height: 250,
                            child: Swiper(
                              itemCount: 10,
                              itemBuilder: (BuildContext,int idx){
                                return _getRecipeUI(datas[idx]['IMG_URL'],datas[idx]['RECIPE_NM_KO'],datas[idx]['SUMRY'],datas[idx]['recipe_cnt']);
                              },
                              pagination: SwiperPagination(
                                builder: DotSwiperPaginationBuilder(
                                    color: Colors.white.withOpacity(0.6),
                                    activeColor: Colors.black
                                )
                              ),
                              control: const SwiperControl(
                                  color: Colors.black
                              ),
                            )
                          );
                        }
                      }
                    )
                  ]
              )
          )
      ),
    );
  }
  // 추천 레시피의 UI
  Widget _getRecipeUI(String _url, String _nm, String _sumry, int _cnt){
    return Stack(
      children: [
        Container(
          width: double.infinity,
            foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(
                colors: [Colors.black,Colors.transparent,Colors.transparent, Color(0xffffa511)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0,0.12,0.55, 1],
              ),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(_url,fit: BoxFit.cover)
            )
        ),
        Positioned(
            right: 0,
            child:Container(
                margin: EdgeInsets.all(15),
                child: Text('겹치는 재료수 : $_cnt개',
                    style: TextStyle(color: Colors.white, shadows: [Shadow(blurRadius: 8,color: Colors.black,offset: Offset(1,1))])
                )
            )
        ),
        Positioned(
            bottom: 0,
            child: Container(
                width: 350,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(_nm,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white, shadows: [Shadow(blurRadius: 5,color: Colors.black,offset: Offset(1,1))])),
                    SizedBox(height: 7),
                    Text(_sumry,style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis),
                    SizedBox(height: 20)
                  ],
                )
            )
        )
      ]
    );
  }
  // 레시피 추천 함수
  Future<dynamic> _getRecommandRecipe() async{
    if(_selectedIngredient.isEmpty || _selectedMaximum==-1){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('재료와 상한을 입력해 주세요.')));
      return;
    }
    // -> 조건에 맞는 레시피 가져오기 -> 레시피 UI 부르기
    return await recipeDBHelper.getRecommandRecipe(_selectedIngredient);
  }
  // 추천받은 레시피 10개 display

  void _handleSubmitted(String text){
    if(text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Plz PUTT')));
      return;
    }
    _searchRecipeController.clear();
    recommandIngredientFuture = _getRecipe(text);
    //print(searchRecipe);
    setState(() {
      _showRecipe = false;
    });
  }
  Container makeIngredient_con(ingredientName){
    return Container(
      padding :const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(ingredientName),OutlinedButton(onPressed: (){}, child: const Text('구매'))],
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
  void showHelpDialog(idx){
    var title = ['재료 추천 기능','레시피 추천 기능'];
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
                Text(title[idx]),
                IconButton(
                    onPressed: ()=>Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded),color: Colors.grey)
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                children: const [
                  Text('원하는 레시피에 필요한 재료를 입력해주세요!'),
                  Divider(),
                  Text('사용법',style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                ])
             )
          );
        }
    );
  }

}
