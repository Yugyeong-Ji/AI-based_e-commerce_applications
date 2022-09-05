import 'package:baljachwi_project/widgets/Ingredient.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class IngredientDBHelper{
  final String mainTableName = 'ingredient';
  var _db;
  // getDB
  Future<Database> get database async{
    if(_db!=null) return _db;
    _db = openDatabase(
      join(await getDatabasesPath(),'ingredient.db'),
      onCreate: (db,version) => _createDb(db),
      version: 1
    );
    return _db;
  }
  static void _createDb(Database db){   // DB 생성
    db.execute('create table ingredient(name TEXT PRIMARY KEY, category INTEGER)');

  }
 Future<void> insertIngredient(Ingredient ingredient) async{
   final db = await database;
   await db.insert(
     mainTableName,
     ingredient.toMap(),
     conflictAlgorithm: ConflictAlgorithm.replace
   );
 }
 Future<List<Ingredient>> getAllIngredients() async{
    final db = await database;
    final List<Map<String,dynamic>> maps = await db.query('ingredient',orderBy: "category");
    return List.generate(maps.length, (i){
      return Ingredient(maps[i]['name'], maps[i]['category']);
    });
 }
 Future<dynamic> getIngredient(String name) async{
    final db = await database;
    final List<Map<String,dynamic>> maps = (await db.query('ingredient',where:'name=?',whereArgs: [name]));
    return maps.isNotEmpty ? maps.first['kind']:null;
 }
 Future<void> updateIngredient(Ingredient ingredient) async{
   final db = await database;
   await db.update(
       mainTableName,
       ingredient.toMap(),
       where: "name = ? ",
       whereArgs: [ingredient.name]
   );
 }
 Future<void> deleteIngredient(String name) async{
    final db = await database;
    await db.delete(
      mainTableName,
      where:"name = ?",
      whereArgs: [name],
    );
 }
}