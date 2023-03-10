import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/core/app/app_dependency.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/screens/category/cubit/category_state.dart';
import 'package:receptyUser/features/screens/category/model/category_model.dart';
import 'package:receptyUser/features/screens/category/repository/category_repo_imp.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final AppPreferences _appPreferences;
  final CategoryRepositoryImp categoryRepositoryImp;

  CategoryCubit(this.categoryRepositoryImp)
      : _appPreferences = instance.get(),
        super(CategoryState());

  Future<void> getCategory() async {
    emit(state.copyWith(
        status: CategoryStatus.loading,
        categoryModel: CategoryModel(),
        message: ""));
    showProgressDialog();

    final response = await categoryRepositoryImp.getCategory({});

    response.fold(
      (failure) {
        emit(state.copyWith(status: CategoryStatus.failure));
      },
      (data) async {
        emit(state.copyWith(
            status: CategoryStatus.success, categoryModel: data));
      },
    );
  }
}
