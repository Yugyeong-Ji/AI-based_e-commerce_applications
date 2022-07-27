import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as parse;
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:card_swiper/card_swiper.dart';

class Recipe{
  var title;
  var imgPath;
  var ingredient;
  @override
  String toString(){
    return "title : "+title+"\n"+"img : "+imgPath;
  }
  Recipe(this.title,this.imgPath,this.ingredient);
}
final List<String> items = [
  '~10,000',
  '~30,000',
  '~50,000',
  '~100,000',
  '무제한',
];
String? selectedValue;
class Home_Recipe extends StatefulWidget {
  @override
  _Recipe createState()=> _Recipe();
}

class _Recipe extends State<Home_Recipe>{
  var top10Future;  // 실시간 인기레시피를 불러오기 위한 Future 변수
  var recommandIngredientFuture;  // 재료추천을 위한 Future 변수
  final searchRecipe=null;
  final _searchRecipeController = TextEditingController();
  final _searchIngredientController = TextEditingController();
  bool _showRecipe = true;

  // TOP10 뽑는 메소드
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

  Future<Recipe> _getRecipe(recipeName) async{
    print('call _getRecipe'+recipeName);
    var response = await http.get(Uri.parse('https://www.10000recipe.com/recipe/list.html?q='+recipeName));
    dom.Document document = parse.parse(response.body);
    var isNone = document.getElementsByClassName('result_none');
    if(isNone.length!=0){
      print(isNone[0].innerHtml);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(recipeName+"에 대한 검색결과가 없습니다.")));
      setState(() {
        _showRecipe = true;
      });
      return Recipe('NONE','NONE', []);
    }else{
      print('\'${recipeName}\' 레시피 존재');
    }
    var ul = document.getElementsByClassName('common_sp_list_ul');
    var li = ul[ul.length-1].getElementsByClassName('common_sp_list_li');
    String path = li[0].getElementsByClassName('common_sp_thumb')[0].getElementsByTagName('a')[0].attributes.values.toString();
    path = 'https://www.10000recipe.com'+path.substring(1,path.indexOf(','));
    print(path);
    // 재료 추출
    var ingredient = [];
    response = await http.get(Uri.parse(path));
    document = parse.parse(response.body);
    // imgPath
    var img = (document.getElementsByClassName('centeredcrop')[0]).getElementsByTagName('img')[0].attributes['src'];
    print("<<img>>");
    print(img);
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
          //amount = li.getElementsByClassName('ingre_unit')[0].innerHtml;
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
  @override
  void initState() {
    super.initState();
    top10Future = _getTop10();
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
                                      autoplay: true,
                                      duration: 1,
                                    )
                                  );
                                }
                              }
                          )
                        ],
                      ),
                    ),
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
                          Divider(thickness: 3,color: Colors.grey[850]),
                          const Text('보유중인 재료에 맞는 레시피를 추천해 드립니다!',style: TextStyle(color: Colors.grey)),
                          Container(
                              alignment: Alignment.centerRight,
                              child: CustomDropdownButton2(
                                  hint: '상한',
                                  value: selectedValue,
                                  dropdownItems: items,
                                  onChanged: (value){
                                    setState((){
                                      selectedValue = value;
                                    }) ;
                                  })
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: const Color(0xffbcbdc2),width: 1)
                                //border: BorderSide(color: Colors.grey)
                              )
                          ),
                          ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  primary: const Color(0xffffa511),
                                  onPrimary: Colors.white,
                                  //minimumSize: Size(MediaQuery.of(context).size.width, 50)
                              ),
                            child: const Text('검색'),
                          )
                        ],
                      ),
                    )
                  ]
              )
          )
      ),
    );
  }
  void _handleSubmitted(String text){
    if(text==null || text.length==0){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Plz PUTT')));
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
      padding :EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                    icon: Icon(Icons.close_rounded),color: Colors.grey)
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                children: const [
                  Text('원하는 레시피에 필요한 재료를 입력해주세요!'),
                  Divider(),
                  Text('사용법',style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                ])
             )
          );
        }
    );
  }
}
