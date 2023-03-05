import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/core/app/app_dependency.dart';
import 'package:receptyUser/core/app/app_preference.dart';

import 'package:receptyUser/features/screens/auth/repository/auth_repo_imp.dart';


part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AppPreferences _appPreferences;
  final AuthRepositoryImp _loginRepository;

  AuthCubit(this._loginRepository)
      : _appPreferences = instance.get(),
        super(AuthState());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController forgotEmailController = TextEditingController();

  Future<void> login({bool isRemember = false}) async {
    /*String token = await _appPreferences.getUserAccessToken();*/
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final response = await _loginRepository.loginUser({
        "email": emailController.text,
        "password": passwordController.text,
      });

      response.fold(
        (failure) {
          if (failure.code == 422) {
            emit(state.copyWith(
                status: LoginStatus.authFail,
                message: failure.error['message']));
          } else {
            emit(state.copyWith(status: LoginStatus.failure));
          }
        },
        (data) async {
          _appPreferences.saveUserData(data);
          _appPreferences.setUserToken(data.accessToken);
          _appPreferences.setIsUserLoggedIn();
          emit(state.copyWith(status: LoginStatus.success));
          resetControllers();
        },
      );
    } on Exception catch (_) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  Future<void> forgot() async {
    emit(state.copyWith(status: LoginStatus.loading));

    final response = await _loginRepository.forgotPassword({
      "email": forgotEmailController.text,
    });

    response.fold(
      (failure) {
        emit(state.copyWith(status: ForgotStatus.failure));
      },
      (data) async {
        emit(state.copyWith(status: ForgotStatus.success));
        resetControllers();
      },
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(status: LogoutStatus.loading));
    final response = await _loginRepository.logout();

    response.fold(
      (failure) {
        emit(state.copyWith(status: LogoutStatus.failure));
      },
      (data) async {
        _appPreferences.logout();
        emit(state.copyWith(status: LogoutStatus.success));
      },
    );
  }

  Future<void> resetControllers() async {
    emailController.clear();
    passwordController.clear();
    forgotEmailController.clear();
    emit(state.copyWith(status: LoginStatus.initial, isEnable: false));
  }
}
