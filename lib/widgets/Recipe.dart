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