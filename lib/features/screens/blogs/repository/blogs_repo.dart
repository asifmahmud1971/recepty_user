import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/data/network/api_client.dart';
import 'package:receptyUser/data/network/api_exception.dart';
import 'package:receptyUser/data/network/api_failure.dart';
import 'package:receptyUser/data/network/urls.dart';
import 'package:receptyUser/features/screens/blogs/model/BlogsModel.dart';


import 'blogs_repo_imp.dart';

@Injectable(as: BlogsRepositoryImp)
class BlogsRepository implements BlogsRepositoryImp {
  final ApiClient apiClient;

  BlogsRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, BlogsModel>> getBlogs(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: Urls.blogs, method: Method.get, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(BlogsModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, Blogs>> createBlogs(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: Urls.blogs, method: Method.post, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(Blogs.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, BlogsModel>> updateBlogs(
      Map<String, dynamic> params,
      {id}) async {
    try {
      final response = await await apiClient.request(
          url: "${Urls.blogs}/$id", method: Method.put, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(BlogsModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> deleteBlogs(
      Map<String, dynamic> params,
      {id}) async {
    try {
      final response = await await apiClient.request(
          url: "${Urls.blogs}/$id", method: Method.delete, params: params);

      //log("All Headers ====> " + response[1].toString());

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
