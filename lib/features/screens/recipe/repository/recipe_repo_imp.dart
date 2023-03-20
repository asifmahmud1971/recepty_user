import 'package:dartz/dartz.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/features/screens/recipe/model/recipe_list_model.dart';

import '../model/bookmark_model.dart';
import '../model/recipe_desc_model.dart';

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

abstract class RecipeRepositoryImp {
  Future<Either<ApiFailure, RecipeListModel>> getRecipeList(
      Map<String, dynamic> params,{id});
  Future<Either<ApiFailure, RecipeListModel>> searchRecipe(
      Map<String, dynamic> params,{title});



  Future<Either<ApiFailure, RecipeDescModel>> getRecipeDesc(
      Map<String, dynamic> params,{id});
  Future<Either<ApiFailure, BookmarkModel>> addBookmark(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> createRecipe(
      Map<String, dynamic> params);
    Future<Either<ApiFailure, dynamic>> uploadRecipeVideo(
       params,{id});

  Future<Either<ApiFailure, Ingredients>> updateIngredients(
      Map<String, dynamic> params,
      {id});

  Future<Either<ApiFailure, dynamic>> deleteIngredients(
      Map<String, dynamic> params,
      {id});
}
