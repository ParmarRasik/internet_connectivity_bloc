import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
enum InternetStateEnum {
  initial,
  lost,
  gain
}
class InternetCubit extends Cubit<InternetStateEnum>{
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetCubit():super(InternetStateEnum.initial){
    streamSubscription = connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        emit(InternetStateEnum.gain);
      }else{
        emit(InternetStateEnum.lost);
      }
    });
  }

@override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}