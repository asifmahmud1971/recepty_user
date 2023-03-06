
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/data/network/api_client.dart';
import 'package:receptyUser/data/network/api_exception.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/data/network/urls.dart';
import 'package:receptyUser/features/screens/auth/models/login_response.dart';


import 'auth_repo_imp.dart';

@Injectable(as: AuthRepositoryImp)
class AuthRepository implements AuthRepositoryImp {
  final ApiClient apiClient;

  AuthRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: Urls.login, method: Method.post, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(LoginResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> forgotPassword(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: Urls.login, method: Method.post, params: params);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
  @override
  Future<Either<ApiFailure, dynamic>> registration(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: Urls.registration, method: Method.post, params: params);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
  @override
  Future<Either<ApiFailure, dynamic>> otpMatch(
      Map<String, dynamic> params,{id,otp}) async {
    try {
      final response = await await apiClient.request(
          url: "${Urls.user}/$id/verify/$otp", method: Method.post, params: params);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> logout() async {
    try {
      final response =
          await await apiClient.request(url: Urls.login, method: Method.delete);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
