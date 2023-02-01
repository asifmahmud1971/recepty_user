part of 'internet_cubit.dart';

enum NetworkState { initial, loading, slowConnection, connected, disconnected }

class InternetState extends Equatable {
  final NetworkState status;
  final bool previousDisconnected;

  const InternetState({
    this.status = NetworkState.initial,
    this.previousDisconnected = false,
  });

  InternetState copyWith(
      {final NetworkState? status, final bool? previousDisconnected}) {
    return InternetState(
      status: status ?? this.status,
      previousDisconnected: previousDisconnected ?? this.previousDisconnected,
    );
  }

  @override
  List<Object> get props => [status, previousDisconnected];
}
