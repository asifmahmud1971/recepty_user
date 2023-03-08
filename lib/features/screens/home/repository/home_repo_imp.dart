import 'package:dartz/dartz.dart';
import 'package:receptyUser/data/network/api_failure.dart';

import '../model/home_model.dart';

abstract class HomeRepositoryImp {
  Future<Either<ApiFailure, HomeModel>> getHome(Map<String, dynamic> params);
}
