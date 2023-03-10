import 'package:dartz/dartz.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/features/screens/category/model/category_model.dart';

abstract class CategoryRepositoryImp {
  Future<Either<ApiFailure, CategoryModel>> getCategory(
      Map<String, dynamic> params);
}
