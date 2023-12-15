

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_app_flutter/data/blocs/home_bloc/home_event.dart';
import 'package:map_app_flutter/data/blocs/home_bloc/home_state.dart';
import 'package:map_app_flutter/data/models/place_model.dart';
import 'package:map_app_flutter/data/services/network_service.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NetworkService networkService;

  HomeBloc(this.networkService) : super(HomeInitialState()) {
    on<HomeLoadedEvent>((event, emit) async {
      emit(HomeLoadInProgressState());
      List<PlaceModel>? places = await networkService.getPlaces(
        60.85666860,
        72.23637900,
        37.94090050,
        43.80413340,
        "json",
        "5ae2e3f221c38a28845f05b692af020e1bb9ec5f0c087c099fcaabd3",
      );
      if (places != null) {
        emit(HomeLoadSuccessState(places));
      } else {
        emit(HomeLoadFailureState());
      }
    });
  }
}