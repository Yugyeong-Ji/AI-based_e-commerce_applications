// 레시피 클래스 /
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
// 레시피 기본 클래스
class RecipeBasic{
  var recipe_id;  // 레시피 코드
  var recipe_nm_ko; // 레시피 이름
  var sumary;       // 요약
  var nation_code;
  var natino_nm;
  var ty_code;
  var ty_nm;      // 음식 분류
  var cooking_time; // 조리 시간
  var calorie;    // 칼로리
  var qnt;        // 난이도
  var level_nm;   // 재료별 분류명
  var irdnt_code;
  var pc_nm;
  var img_url;
  var det_url;
  RecipeBasic(this.recipe_id,this.recipe_nm_ko,this.sumary,
      this.nation_code,this.natino_nm, this.ty_code, this.ty_nm,
      this.cooking_time,this.calorie,this.qnt,this.level_nm,
      this.irdnt_code,this.pc_nm,this.img_url,this.det_url);
}
// 레시피 재료 클래스
class RecipeIngredients{
  var recipe_id;  // 레시피 코드
  var irdnt_sn;   // 재료 순번
  var irdnt_nm;   // 재료 명
  var irdnt_cpcty;   // 재료 용량
  var irdnt_ty_code;  // 재료 코드 (3060001 : '주재료', )

  RecipeIngredients(this.recipe_id, this.irdnt_sn, this.irdnt_nm, this.irdnt_cpcty, this.irdnt_ty_code);
}