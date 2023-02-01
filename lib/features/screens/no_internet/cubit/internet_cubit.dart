import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'internet_state.dart';

@injectable
class InternetCubit extends Cubit<InternetState> {
  final Connectivity? connectivity = Connectivity();
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit() : super(const InternetState()) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() async {
    connectivityStreamSubscription =
        connectivity!.onConnectivityChanged.listen((connectivityResult) async {
      try {
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.ethernet) {
          emit(state.copyWith(status: NetworkState.connected));
        } else if (connectivityResult == ConnectivityResult.none) {
          emit(state.copyWith(
              status: NetworkState.disconnected, previousDisconnected: true));
        }
      } on SocketException catch (_) {
        emit(state.copyWith(
            status: NetworkState.disconnected, previousDisconnected: true));
      }
    });
  }

  @override
  Future<void> close() async {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
