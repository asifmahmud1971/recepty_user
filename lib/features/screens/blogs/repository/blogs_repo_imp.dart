import 'package:dartz/dartz.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/features/screens/blogs/model/BlogsModel.dart';

abstract class BlogsRepositoryImp {
  Future<Either<ApiFailure, BlogsModel>> getBlogs(
      Map<String, dynamic> params);

}
