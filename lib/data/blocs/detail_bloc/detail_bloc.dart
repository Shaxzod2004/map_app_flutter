

import 'package:bloc/bloc.dart';
import 'package:map_app_flutter/data/blocs/detail_bloc/detail_event.dart';
import 'package:map_app_flutter/data/blocs/detail_bloc/detail_state.dart';
import 'package:map_app_flutter/data/models/places_detail_model.dart';
import 'package:map_app_flutter/data/services/network_service.dart';

class DetailBloc extends Bloc<DetailEvent,DetailState>{

  NetworkService networkService;
  DetailBloc(this.networkService):super(DetailInitial()){
    on<DetailLoadedEvent>((event, emit) async{
      emit(DetailLoadInProgressState());
      PlacesDetailModel? placesDetailModel=await networkService.getPlaceDetail(
          event.xid,"5ae2e3f221c38a28845f05b692af020e1bb9ec5f0c087c099fcaabd3");
      if (placesDetailModel != null) {
        emit(DetailLoadSuccessState(placesDetailModel));
      } else {
        emit(DetailLoadFailureState());
      }
    });
  }



}