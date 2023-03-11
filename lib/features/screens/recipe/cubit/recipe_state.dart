import 'package:equatable/equatable.dart';
import 'package:receptyUser/features/screens/recipe/model/recipe_list_model.dart';

import '../model/recipe_desc_model.dart';

enum RecipeStatus {
  loading,
  initial,
  authFail,
  success,
  bookmarkAddSuccess,
  recipeCreateSuccess,
  recipeUpdateSuccess,
  recipeUploadSuccess,
  recipeDeleteSuccess,
  failure,
}

class RecipeState extends Equatable {
  final RecipeStatus status;
  final String? message;
  final RecipeListModel? recipeListModel;
  final RecipeDescModel? recipeDescModel;


  const RecipeState({
    this.status = RecipeStatus.initial,
    this.message,
    this.recipeListModel,
    this.recipeDescModel
  });

  RecipeState copyWith({
    RecipeStatus? status,
    bool? isEnable,
    String? message,
    RecipeListModel? recipeListModel,
    RecipeDescModel? recipeDescModel
  }) {
    return RecipeState(
        status: status ?? this.status,
        message: message ?? this.message,
      recipeListModel: recipeListModel??this.recipeListModel,
      recipeDescModel: recipeDescModel??this.recipeDescModel
);
  }

  @override
  List<Object> get props =>
      [status, message ?? "",recipeListModel??{},recipeDescModel??{}];
}
