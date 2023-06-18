import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/cubits/counter_cubit/counter_cubit.dart';

class StopWatchCubit extends Cubit<String>{
  StopWatchCubit():super("Nothing");

  void start(){
    emit("start");
  }
  void reset(){

    emit("hold");
    Timer(const Duration(milliseconds: 100),(){
      emit("reset");
    }

    );


  }
  void delete (int value){
    stoplist.remove(value);
    emit("Nothing");
  }


}