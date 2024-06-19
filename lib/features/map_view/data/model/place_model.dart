import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel{
  String name;
  LatLng latLng;
  String id;

  PlaceModel({required this.name,required this.latLng, required this.id});
}