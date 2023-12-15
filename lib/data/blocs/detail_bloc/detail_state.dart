


import 'package:map_app_flutter/data/models/places_detail_model.dart';

class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoadInProgressState extends DetailState {}

class DetailLoadFailureState extends DetailState {}

class DetailLoadSuccessState extends DetailState {
  final PlacesDetailModel placesDetailModel;

  DetailLoadSuccessState(this.placesDetailModel);
}
