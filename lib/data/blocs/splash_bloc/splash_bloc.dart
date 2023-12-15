

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_app_flutter/data/blocs/splash_bloc/splash_event.dart';
import 'package:map_app_flutter/data/blocs/splash_bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent,SplashState>{

  SplashBloc():super(SplashInitialState()){
  on<SplashEvent>((event, emit)async{

   await Future.delayed(Duration(seconds: 5),()  {
       emit(SplashLoadedState());
    });
  });
  }



}