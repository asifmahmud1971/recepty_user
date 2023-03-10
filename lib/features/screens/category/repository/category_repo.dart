import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/data/network/api_client.dart';
import 'package:receptyUser/data/network/api_exception.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/data/network/urls.dart';
import 'package:receptyUser/features/screens/category/model/category_model.dart';

import 'category_repo_imp.dart';

@Injectable(as: CategoryRepositoryImp)
class CategoryRepository implements CategoryRepositoryImp {
  final ApiClient apiClient;

  CategoryRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, CategoryModel>> getCategory(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: Urls.categories, method: Method.get, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(CategoryModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
