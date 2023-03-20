import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/core/app/app_dependency.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_state.dart';
import 'package:receptyUser/features/screens/recipe/model/recipe_desc_model.dart';
import 'package:receptyUser/features/screens/recipe/model/recipe_list_model.dart';

import '../repository/recipe_repo_imp.dart';

@injectable
class RecipeCubit extends Cubit<RecipeState> {
  final AppPreferences _appPreferences;
  final RecipeRepositoryImp recipeRepositoryImp;

  RecipeCubit(this.recipeRepositoryImp)
      : _appPreferences = instance.get(),
        super(RecipeState());

  Future<void> getRecipeList({catId}) async {
    emit(state.copyWith(
        status: RecipeStatus.loading,
        recipeListModel: RecipeListModel(),
        message: ""));
    showProgressDialog();

    final response =
        await recipeRepositoryImp.getRecipeList({}, id: catId ?? null);

    response.fold(
      (failure) {
        emit(state.copyWith(status: RecipeStatus.failure));
      },
      (data) async {
        emit(state.copyWith(
            status: RecipeStatus.success, recipeListModel: data));
      },
    );
  }

  Future<void> searchRecipe({title}) async {
    emit(state.copyWith(
        status: RecipeStatus.loading,
        searchList: RecipeListModel(),
        message: ""));
    showProgressDialog();

    final response =
    await recipeRepositoryImp.searchRecipe({
      "title":title
    });

    response.fold(
          (failure) {
        emit(state.copyWith(status: RecipeStatus.failure));
      },
          (data) async {
        emit(state.copyWith(
            status: RecipeStatus.success, searchList: data));
      },
    );
  }

  Future<void> getRecipeDesc({id}) async {
    emit(state.copyWith(
        status: RecipeStatus.loading,
        recipeDescModel: state.recipeDescModel,
        message: ""));
    showProgressDialog();

    final response = await recipeRepositoryImp.getRecipeDesc({}, id: id);

    response.fold(
      (failure) {
        emit(state.copyWith(status: RecipeStatus.failure));
      },
      (data) async {
        emit(state.copyWith(
            status: RecipeStatus.success, recipeDescModel: data));
      },
    );
  }

  Future<void> addBookmark({id}) async {
    emit(state.copyWith(
        status: RecipeStatus.loading,
        recipeDescModel: RecipeDescModel(),
        message: ""));
    showProgressDialog();

    final response =
        await recipeRepositoryImp.addBookmark({"tutorial_id": id.toString()});

    response.fold(
      (failure) {
        emit(state.copyWith(status: RecipeStatus.failure));
      },
      (data) async {
        emit(state.copyWith(status: RecipeStatus.bookmarkAddSuccess,recipeDescModel: state.recipeDescModel));
      },
    );
  }
}
