import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/core/app/app_dependency.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/features/screens/home/model/home_model.dart';
import 'package:receptyUser/features/screens/home/repository/home_repo_imp.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final AppPreferences _appPreferences;
  final HomeRepositoryImp homeRepository;

  HomeCubit(this.homeRepository)
      : _appPreferences = instance.get(),
        super(HomeState());

  Future<void> getHome() async {
    /*String token = await _appPreferences.getUserAccessToken();*/
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final response = await homeRepository.getHome({});

      response.fold(
        (failure) {
          emit(state.copyWith(status: HomeStatus.failure));
        },
        (data) async {
          emit(state.copyWith(status: HomeStatus.success,homeModel: data));
        },
      );
    } on Exception catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
