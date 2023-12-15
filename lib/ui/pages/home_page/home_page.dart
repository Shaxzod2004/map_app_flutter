

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_app_flutter/data/blocs/home_bloc/home_bloc.dart';
import 'package:map_app_flutter/data/blocs/home_bloc/home_event.dart';
import 'package:map_app_flutter/data/blocs/home_bloc/home_state.dart';
import 'package:map_app_flutter/data/services/network_service.dart';
import 'package:map_app_flutter/ui/pages/detail_page/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>HomeBloc(NetworkService(Dio()),)..add(HomeLoadedEvent()),
        child: BlocBuilder<HomeBloc,HomeState>(
        builder: (context, state){
          return Scaffold(
            body: getBody(state,context),
          );
        },
      ),
    );
  }

  Widget getBody(HomeState state, BuildContext context) {

    if(state is HomeLoadInProgressState){
      print('object');
      return Center(child: CircularProgressIndicator());
    }
    if(state is HomeLoadFailureState){

      return Center(child:Text("Error"));
    }
    if(state is HomeLoadSuccessState){
      return ListView.builder(
          itemBuilder:(contex,index){
            var list = state.places;
            return InkWell(onTap:(){
               Navigator.pushNamed(context,"/detailPage",arguments:list[index].xid);
            },
                child:Padding(padding:EdgeInsets.only(left:20,top:30),
                  child: Text(list[index].name??"",style: TextStyle(fontSize: 18),)));
      },itemCount:state.places.length,);
    }

    return Text('Initial');

  }
}