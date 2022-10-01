import 'dart:io';
import 'package:baljachwi_project/widgets/Ingredient.dart';
import 'package:baljachwi_project/widgets/Recipe.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class RecipeDBHelper{
  final String mainTableName = 'recipe';
  var _db;
  RecipeDBHelper(){
    getDB();
  }
  Future<Database> getDB() async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, '~www/data.db');
    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      var data = await rootBundle.load(join('assets', 'recipe.db'));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(bytes, flush: true);
    }
    _db = await openDatabase(path);
    return _db;
  }
  Future<dynamic> getRecipe(String name) async{
    final db = _db;
    final List<Map<String,dynamic>> maps = (await db.query('recipe_basic',where:'recipe_nm_ko=?',whereArgs: [name]));
    return maps.isNotEmpty ? maps.first:null;
  }
  Future<dynamic> getRecommandRecipe(List<String> _selectedIngredient) async{
    Database db = _db;
    String irdntsSql = 'A.irdnt_nm =? ${'OR A.irdnt_nm=? '*(_selectedIngredient.length-1)}';
    String query = 'select B.recipe_nm_ko, B.sumry, B.img_url, C.recipe_cnt from recipe_basic B,(select A.recipe_id, count(A.irdnt_nm) as recipe_cnt from recipe_ingredient A where ${irdntsSql}group by A.recipe_id order by count(A.irdnt_nm)) C where B.recipe_id = C.recipe_id order by C.recipe_cnt desc limit 10';
    final List<Map<String,dynamic>> maps = await db.rawQuery(query,_selectedIngredient);
    return maps.isNotEmpty ? maps:null;
  }
}