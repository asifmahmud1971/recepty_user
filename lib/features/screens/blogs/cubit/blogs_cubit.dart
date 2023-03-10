import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/core/app/app_dependency.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/screens/blogs/cubit/blogs_state.dart';
import 'package:receptyUser/features/screens/blogs/model/BlogsModel.dart';
import 'package:receptyUser/features/screens/blogs/repository/blogs_repo_imp.dart';

@injectable
class BlogsCubit extends Cubit<BlogsState> {
  final AppPreferences _appPreferences;
  final BlogsRepositoryImp blogsRepositoryImp;

  BlogsCubit(this.blogsRepositoryImp)
      : _appPreferences = instance.get(),
        super(BlogsState());

  Future<void> getBlogs() async {
    emit(state.copyWith(
        status: BlogsStatus.loading,
        blogsModel: BlogsModel(),
        message: ""));
    showProgressDialog();

    final response = await blogsRepositoryImp.getBlogs({});

    response.fold(
      (failure) {
        emit(state.copyWith(status: BlogsStatus.failure));
      },
      (data) async {
        emit(state.copyWith(
            status: BlogsStatus.success, blogsModel: data));
      },
    );
  }

}
