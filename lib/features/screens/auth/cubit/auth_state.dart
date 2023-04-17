part of 'auth_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  authFail,
  success,
  failure,
  empty }
enum ProfileUpdate {
  initial,
  loading,
  authFail,
  success,
  failure,
}
enum ForgotStatus {
  initial,
  loading,
  authFail,
  success,
  failure,
}

enum ChangePass {
  initial,
  loading,
  authFail,
  noUserFound,
  success,
  failure,
  invalidToken
}

enum RegistrationStatus {
  initial,
  loading,
  authFail,
  registrationSuccess,
  taken,
  failure,
}

enum OtpStatus {
  loading,
  success,
  failure,
  otpFailed,
  otpSuccess,
  otpLoading
}


enum LogoutStatus {
  loading,
  success,
  failure,
}

class AuthState extends Equatable {
  final dynamic status;
  final bool isEnable;
  final String? message;
  final RegistrationResponse? registrationResponse;
  final SendOtpUser? sendOtpUser;

  const AuthState({
    this.status = LoginStatus.initial,
    this.isEnable = false,
    this.message,
    this.registrationResponse,
    this.sendOtpUser,
  });

  AuthState copyWith(
      {final dynamic status,
      final bool? isEnable,
      final String? message,
      RegistrationResponse? registrationResponse,
      SendOtpUser? sendOtpUser}) {
    return AuthState(
        status: status ?? this.status,
        isEnable: isEnable ?? this.isEnable,
        message: message ?? this.message,
        sendOtpUser: sendOtpUser ?? this.sendOtpUser,
        registrationResponse:
            registrationResponse ?? this.registrationResponse);
  }

  @override
  List<Object> get props => [
        status,
        isEnable,
        message ?? "",
        registrationResponse ?? {},
        sendOtpUser ?? {}
      ];
}
