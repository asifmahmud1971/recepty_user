part of 'auth_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  authFail,
  success,
  failure,
}

enum RegistrationStatus {
  initial,
  loading,
  authFail,
  registrationSuccess,
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

  const AuthState( {
    this.status = LoginStatus.initial,
    this.isEnable = false,
    this.message,
    this.registrationResponse,
  });

  AuthState copyWith({
    final dynamic status,
    final bool? isEnable,
    final String? message,
    RegistrationResponse? registrationResponse
  }) {
    return AuthState(
      status: status ?? this.status,
      isEnable: isEnable ?? this.isEnable,
      message: message ?? this.message,
      registrationResponse: registrationResponse??this.registrationResponse
    );
  }

  @override
  List<Object> get props => [status, isEnable, message ?? "",registrationResponse??{}];
}
