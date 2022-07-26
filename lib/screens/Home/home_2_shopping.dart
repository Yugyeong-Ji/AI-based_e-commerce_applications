import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parse;
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:beautiful_soup_dart/beautiful_soup.dart';
class Home_Shopping extends StatefulWidget {
  @override
  _Shopping createState() => _Shopping();
}
class Recipe{
  var name;
  var amount;
  Recipe(this.name,this.amount);
}
class _Shopping extends State<Home_Shopping>{
  var ingredient = [];
  void _getRecipe_ingredient(url) async{
    final response = await http.get(Uri.parse(url));
    dom.Document document = parse.parse(response.body);
    var res = document.getElementsByClassName('ready_ingre3')[0];
    for(var ul in res.getElementsByTagName('ul')){
      if(ul.getElementsByTagName('b')[0].innerHtml.contains('재료')){
        // 재료부분 가져오기!
        for(var li in ul.getElementsByTagName('li')){
          String title,amount;
          var tmp = li.getElementsByTagName('a');
          amount = li.getElementsByClassName('ingre_unit')[0].innerHtml;
          if(tmp==null || tmp.length==0){
            title = li.innerHtml;
            title = title.toString().substring(0,title.indexOf('<span')).trim();
          }
          else{
            title = tmp[0].innerHtml;
            title = title.substring(0,title.indexOf('<img')).trim();
          }
          ingredient.add(Recipe(title,amount));
        }
      }
    }
    print(ingredient.length);
    for(Recipe r in ingredient){
      print(r.name +" - "+r.amount);
    }
  }
  void _getRecipe(recipeName) async{
    final response = await http.get(Uri.parse('https://www.10000recipe.com/recipe/list.html?q='+recipeName));
    dom.Document document = parse.parse(response.body);
    var res = document.getElementsByClassName('common_sp_list_ul');
    print(res.length);

    //String findRecipe = 'https://www.10000recipe.com/recipe/6904987';
    //_getRecipe_ingredient(findRecipe);
  }
  @override
  void initState() {
    _getRecipe('김치찌개');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('자취 추천')
        ),
      ),
    );
  }
}