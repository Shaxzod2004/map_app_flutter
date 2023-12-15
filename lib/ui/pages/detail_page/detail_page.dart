
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_app_flutter/data/blocs/detail_bloc/detail_bloc.dart';
import 'package:map_app_flutter/data/blocs/detail_bloc/detail_event.dart';
import 'package:map_app_flutter/data/blocs/detail_bloc/detail_state.dart';
import 'package:map_app_flutter/data/services/network_service.dart';
import 'package:map_app_flutter/ui/pages/map_page/map_page.dart';

class DetailPage extends StatelessWidget {
   DetailPage({super.key,required this.xid});

  String xid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>DetailBloc(NetworkService(Dio()))..add(DetailLoadedEvent(xid)),
      child: BlocBuilder<DetailBloc,DetailState>(
      builder: (context,state){

        return Scaffold(
          appBar: AppBar(
          ),
          body: Center(
            child:getBody(state),
          ),
          floatingActionButton:FloatingActionButton(
            onPressed:state is DetailLoadSuccessState?(){
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context)=>
                  MapPage(lat:state.placesDetailModel.point?.lat??0,lon:state.placesDetailModel.point?.lon??0, name:state.placesDetailModel.name!)
              )
              );
            }:null,
            child: Icon(Icons.map),
          ),
        );
      },
      ),
    );
  }

   Widget getBody(DetailState state) {
    if (state is DetailLoadInProgressState) return CircularProgressIndicator();
    if (state is DetailLoadFailureState) return Text("ERROR");
    if (state is DetailLoadSuccessState) {
      return Column(
        children: [
          SizedBox(
            height:40,
          ),
          Container(
            height: 300,
            width: 400,
            child: CachedNetworkImage(
              imageUrl:'${state.placesDetailModel.preview?.source}',
              placeholder: (context, url) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          //  Image.network('${state.placesDetailModel.preview?.source}'),
          Text(state.placesDetailModel.wikipediaExtracts?.title ?? ""),


          Container(
            height:371,
            child: ListView(
              children: [
                Padding(padding:EdgeInsets.only(left:10,right:10),
                  child: Text(state.placesDetailModel.wikipediaExtracts?.text ?? ""),),
              ],
            ),
          )
        ],
      );
    }
    return const Text("INITIAL");
  }



}
