import 'package:equatable/equatable.dart';
import 'package:receptyUser/features/screens/blogs/model/BlogsModel.dart';
import 'package:receptyUser/features/screens/category/model/category_model.dart';

enum BlogsStatus {
  loading,
  initial,
  authFail,
  success,
  blogsCreateSuccess,
  blogsDeleteSuccess,
  blogsUpdateSuccess,
  failure,
}

class BlogsState extends Equatable {
  final BlogsStatus status;
  final String? message;
  final BlogsModel? blogsModel;
  final List<Blogs>? blogs;

  const BlogsState({
    this.status = BlogsStatus.initial,
    this.message,
    this.blogsModel,
    this.blogs,
  });

  BlogsState copyWith({
    BlogsStatus? status,
    bool? isEnable,
    String? message,
    BlogsModel? blogsModel,
  }) {
    return BlogsState(
        status: status ?? this.status,
        message: message ?? this.message,
        blogsModel: blogsModel ?? this.blogsModel,
        blogs: blogs ?? this.blogs);
  }

  @override
  List<Object> get props =>
      [status, message ?? "", blogsModel ?? {}, blogs ?? []];
}
