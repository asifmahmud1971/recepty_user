import 'package:dartz/dartz.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/features/screens/auth/models/login_response.dart';

abstract class AuthRepositoryImp {
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> forgotPassword(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> registration(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, dynamic>> otpMatch(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> logout();
}
