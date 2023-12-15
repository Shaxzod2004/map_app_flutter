

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_app_flutter/data/blocs/splash_bloc/splash_bloc.dart';
import 'package:map_app_flutter/data/blocs/splash_bloc/splash_event.dart';
import 'package:map_app_flutter/data/blocs/splash_bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>SplashBloc()..add(SplashEvent()),
    child: BlocListener<SplashBloc,SplashState>(
      listener: (context,state){
        if(state is SplashLoadedState){
         Navigator.pushReplacementNamed(context,'/homePage');
        }
      },
      child: Scaffold(
        body: Center(
          child:Icon(Icons.location_on_outlined,size:100,),
        ),
      ),
    ),
    );
  }
}
