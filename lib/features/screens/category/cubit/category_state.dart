import 'package:equatable/equatable.dart';
import 'package:receptyUser/features/screens/category/model/category_model.dart';

enum CategoryStatus {
  loading,
  initial,
  authFail,
  success,
  categoryCreateSuccess,
  categoryDeleteSuccess,
  categoryUpdateSuccess,
  failure,
}

class CategoryState extends Equatable {
  final CategoryStatus status;
  final String? message;
  final CategoryModel? categoryModel;
  final List<Categories>? categories;

  const CategoryState({
    this.status = CategoryStatus.initial,
    this.message,
    this.categoryModel,
    this.categories,
  });

  CategoryState copyWith({
    CategoryStatus? status,
    bool? isEnable,
    String? message,
    CategoryModel? categoryModel,
    List<Categories>? categories,
  }) {
    return CategoryState(
        status: status ?? this.status,
        message: message ?? this.message,
        categoryModel: categoryModel ?? this.categoryModel,
        categories: categories ?? this.categories);
  }

  @override
  List<Object> get props =>
      [status, message ?? "", categoryModel ?? {}, categories ?? []];
}
