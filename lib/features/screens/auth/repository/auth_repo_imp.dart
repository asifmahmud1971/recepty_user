import 'package:dartz/dartz.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/features/screens/auth/models/SendOtpUser.dart';
import 'package:receptyUser/features/screens/auth/models/login_response.dart';
import 'package:receptyUser/features/screens/auth/models/registration_response.dart';

abstract class AuthRepositoryImp {
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, SendOtpUser>> forgotPassword(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> changePassword(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, LoginResponse>> profileUpdate(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, dynamic>> getActive(
      Map<String, dynamic> params);
 Future<Either<ApiFailure, dynamic>> packageEntry(
      Map<String, dynamic> params);



  Future<Either<ApiFailure, RegistrationResponse>> registration(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, dynamic>> otpMatch(
      Map<String, dynamic> params,{id,otp});

  Future<Either<ApiFailure, dynamic>> logout();
}
