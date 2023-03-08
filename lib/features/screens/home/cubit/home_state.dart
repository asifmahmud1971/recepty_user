part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  authFail,
  success,
  failure,
}


class HomeState extends Equatable {
  final dynamic status;
  final String? message;
  final HomeModel? homeModel;

  const HomeState( {
    this.status = HomeStatus.initial,
    this.message,
    this.homeModel,
  });

  HomeState copyWith({
    final dynamic status,
    final bool? isEnable,
    final String? message,
    HomeModel? homeModel
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      homeModel: homeModel??this.homeModel
    );
  }

  @override
  List<Object> get props => [status, message ?? "",homeModel??{}];
}
