import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:map_app_flutter/data/models/place_model.dart';
import 'package:map_app_flutter/data/models/places_detail_model.dart';
import 'package:retrofit/retrofit.dart';

part 'network_service.g.dart';

@RestApi(baseUrl: 'http://api.opentripmap.com/0.1/en/places/')
abstract class NetworkService {
  factory NetworkService(Dio dio, {String baseUrl}) = _NetworkService;

  @GET('/bbox')
  Future<List<PlaceModel>?> getPlaces(
      @Query("lon_min") double lonMin,
      @Query("lon_max") double lonMax,
      @Query("lat_min") double latMin,
      @Query("lat_max") double latMax,
      @Query("format") String format,
      @Query("apikey") String apikey,
      );

  @GET('/xid/{id}')
  Future<PlacesDetailModel?> getPlaceDetail(
      @Path() String id,
      @Query("apikey") String apikey,
      );

}
