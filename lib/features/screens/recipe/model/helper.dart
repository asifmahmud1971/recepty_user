
import 'package:receptyUser/features/screens/recipe/model/recipe_desc_model.dart';

class CategorySelect{
  bool? forSelect;
  int?id;
  CategorySelect({this.forSelect,this.id});
}

class IngredientsSelect{
  bool? forSelect;
  int?id;
  IngredientsSelect({this.forSelect,this.id});
}
class RecipeArgument{
  List<Ingredients>? ingredientsList;
  List<int>? selectedList;
  bool? forSelect;
  RecipeArgument({this.ingredientsList,this.selectedList, this.forSelect,});
}