

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app_flutter/data/models/place_model.dart';

class MapPage extends StatelessWidget {
   MapPage({super.key,required this.lat,required this.lon,required this.name});

  double lat;
  double lon;

  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(lat,lon),
            zoom: 18,
          ),
          markers: Set.of({
            Marker(
              markerId: MarkerId("asa"),
              position: LatLng(
                lat,
                lon,
              ),
              infoWindow: InfoWindow(title: "$name", snippet: '*'),
              onTap: () {},
            )
          }),
          onMapCreated: (GoogleMapController controller) {
            // _controller.complete(controller);
          },
        ),
      );

  }
}