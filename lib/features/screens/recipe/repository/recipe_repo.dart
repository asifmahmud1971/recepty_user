import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/data/network/api_client.dart';
import 'package:receptyUser/data/network/api_exception.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/data/network/urls.dart';
import 'package:receptyUser/features/screens/recipe/model/bookmark_model.dart';
import 'package:receptyUser/features/screens/recipe/model/recipe_list_model.dart';

import '../model/recipe_desc_model.dart';
import 'recipe_repo_imp.dart';

@Injectable(as: RecipeRepositoryImp)
class RecipeRepository implements RecipeRepositoryImp {
  final ApiClient apiClient;

  RecipeRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, RecipeListModel>> getRecipeList(
      Map<String, dynamic> params,{id}) async {
    try {
      final response = await await apiClient.request(
          url:
          id!=null?Urls.tutorialsByCategory(id):
          Urls.tutorials, method: Method.get, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(RecipeListModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }


  @override
  Future<Either<ApiFailure, RecipeDescModel>> getRecipeDesc(
      Map<String, dynamic> params,
      {id}) async {
    try {
      final response = await await apiClient.request(
          url: "${Urls.tutorials}/$id", method: Method.get, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(RecipeDescModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, BookmarkModel>> addBookmark(Map<String, dynamic> params) async{
    try {
      final response = await await apiClient.request(
          url: "${Urls.bookmarks}", method: Method.post, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(BookmarkModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> createRecipe(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: Urls.tutorials, method: Method.post, params: params);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> uploadRecipeVideo(params, {id}) async {
    try {
      final response = await await apiClient.requestWithFile(
          url: "${Urls.tutorials}/video-upload",
          method: Method.post,
          params: params);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, Ingredients>> updateIngredients(
      Map<String, dynamic> params,
      {id}) async {
    try {
      final response = await await apiClient.request(
          url: "${Urls.ingredients}/$id", method: Method.put, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(Ingredients.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> deleteIngredients(
      Map<String, dynamic> params,
      {id}) async {
    try {
      final response = await await apiClient.request(
          url: "${Urls.ingredients}/$id",
          method: Method.delete,
          params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }


}
