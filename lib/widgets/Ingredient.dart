class Ingredient{
  String name;
  int category;
  Ingredient(this.name,this.category);
  Map<String,dynamic> toMap(){
    return {'name':name,'category':category};
  }
}