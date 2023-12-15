

import 'package:map_app_flutter/data/models/place_model.dart';

class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadInProgressState extends HomeState {}

class HomeLoadSuccessState extends HomeState {
  final List<PlaceModel> places;

  HomeLoadSuccessState(this.places);
}

class HomeLoadFailureState extends HomeState {}
