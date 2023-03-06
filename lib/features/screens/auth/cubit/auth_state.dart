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

enum ForgotStatus {
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

  const AuthState({
    this.status = LoginStatus.initial,
    this.isEnable = false,
    this.message,
  });

  AuthState copyWith({
    final dynamic status,
    final bool? isEnable,
    final String? message,
  }) {
    return AuthState(
      status: status ?? this.status,
      isEnable: isEnable ?? this.isEnable,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, isEnable, message ?? ""];
}
