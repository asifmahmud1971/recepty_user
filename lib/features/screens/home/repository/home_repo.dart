
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/data/network/api_client.dart';
import 'package:receptyUser/data/network/api_exception.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/data/network/urls.dart';
import 'package:receptyUser/features/screens/auth/models/login_response.dart';
import 'package:receptyUser/features/screens/home/model/home_model.dart';


import 'home_repo_imp.dart';

@Injectable(as: HomeRepositoryImp)
class HomeRepository implements HomeRepositoryImp {
  final ApiClient apiClient;

  HomeRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, HomeModel>> getHome(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: Urls.home, method: Method.get, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(HomeModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

}
