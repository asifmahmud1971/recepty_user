import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:receptyUser/core/app/app_dependency.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/router/routes.dart';
import 'package:receptyUser/features/screens/auth/models/registration_response.dart';
import 'package:receptyUser/features/screens/auth/repository/auth_repo_imp.dart';
import 'package:receptyUser/features/screens/auth/view/subscribe_page.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AppPreferences _appPreferences;
  final AuthRepositoryImp authRepository;

  AuthCubit(this.authRepository)
      : _appPreferences = instance.get(),
        super(AuthState());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController regEmailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController regPasswordController = TextEditingController();

  Future<void> login({bool isRemember = false}) async {
    /*String token = await _appPreferences.getUserAccessToken();*/
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final response = await authRepository.loginUser({
        "email": emailController.text,
        "password": passwordController.text,
      });

      response.fold(
        (failure) {
          if (failure.code == 401) {
            emit(state.copyWith(
                status: LoginStatus.authFail, message: failure.message));
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

  /* Future<void> forgot() async {
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
  }*/
  Future<void> matchOtp({
    userId,
  }) async {
    emit(state.copyWith(status: OtpStatus.otpLoading));

    final response =
        await authRepository.otpMatch({}, id: userId, otp: otpController.text);

    response.fold(
      (failure) {
        emit(state.copyWith(status: OtpStatus.failure));
      },
      (data) async {
        emit(state.copyWith(status: OtpStatus.otpSuccess));
        resetControllers();
      },
    );
  }

  Future<void> getActive() async {
    final response = await authRepository.getActive({});

    response.fold(
      (failure) {
        emit(state.copyWith(status: OtpStatus.failure));
      },
      (data) async {
        if (data['is_subscribed'] == true) {
          GetContext.offAll(Routes.dashboard);
        } else {
          GetContext.toReplace(SubscribePage());
        }
      },
    );
  }

  Future<void> packageEntry({packageNo}) async {
    final response =
        await authRepository.packageEntry({"package_no": packageNo});

    response.fold(
      (failure) {
        emit(state.copyWith(status: OtpStatus.failure));
      },
      (data) async {
        showDialog(
            context: GetContext.context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100.0,
                  ),
                  SizedBox(height: 10.0),
                  Text("Payment Successful!"),
                ],
              ),
            ));
        GetContext.offAll(Routes.dashboard);

      },
    );
  }

  Future<void> registration() async {
    emit(state.copyWith(status: RegistrationStatus.loading));

    final response = await authRepository.registration({
      "name": nameController.text,
      "email": regEmailController.text,
      "phone_number": numberController.text,
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text,
    });

    response.fold(
      (failure) {
        emit(state.copyWith(status: RegistrationStatus.failure));
      },
      (data) async {
        emit(state.copyWith(
            status: RegistrationStatus.registrationSuccess,
            registrationResponse: data));
        resetControllers();
      },
    );
  }

  Future<void> profileUpdate({name, phoneNumber, image}) async {
    emit(state.copyWith(status: ProfileUpdate.loading));

    final response = await authRepository.profileUpdate(
        {"name": name, "phone_number": phoneNumber, "profile_picture": image});

    response.fold(
      (failure) {
        emit(state.copyWith(status: ProfileUpdate.failure));
      },
      (data) async {
        _appPreferences.saveUserData(data);
        emit(state.copyWith(status: ProfileUpdate.success));
      },
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(status: LogoutStatus.loading));
    final response = await authRepository.logout();

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
    numberController.clear();
    regEmailController.clear();
    nameController.clear();
    confirmPasswordController.clear();

    emit(state.copyWith(status: LoginStatus.initial, isEnable: false));
  }
}
