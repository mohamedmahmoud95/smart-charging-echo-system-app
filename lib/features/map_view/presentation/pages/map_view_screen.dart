import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../location_tracker/location_utility_functions/location_permissions_service.dart';
import '../../../location_tracker/location_utility_functions/loction_utility_functions.dart';
import '../../data/model/place_model.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  late GoogleMapController mapController;
  late LatLng currentLocation;

  LocationData? _currentLocation;
  final LocationUtilityFunctions _locationService = LocationUtilityFunctions();
  Future<void> _initializeLocationService() async {
    bool granted = await PermissionService.requestLocationPermission();

    // if (!granted) {
    //     debugPrint("location permission not granted");
    // }
    if (granted) {
      await _locationService.initialize();
      _locationService.getLocationUpdates().listen((LocationData locationData) {
        if (mounted) {
          setState(() {
            _currentLocation = locationData;
            debugPrint(
                "current location: ${locationData.latitude}, ${locationData.longitude}");
          });
        }
      });
    }
  }

  Set<Marker> markers = {};
  Set<PlaceModel> places = {};
  PlaceModel GeeksHub = PlaceModel(
      name: 'Geeks Hub',
      latLng: const LatLng(30.06618986506241, 31.278404555992157),
      id: '1');
  PlaceModel cairoStadium = PlaceModel(
      name: 'Cairo Stadium',
      latLng: const LatLng(30.06930456885379, 31.312090440548857),
      id: '2');
  PlaceModel alexandria = PlaceModel(
      name: 'Alexandria', latLng: const LatLng(30.062129, 31.249999), id: '3');
  PlaceModel alexandria2 = PlaceModel(
      name: 'Alexandria', latLng: const LatLng(30.062120, 31.249990), id: '4');
  PlaceModel alexandria3 = PlaceModel(
      name: 'Alexandria', latLng: const LatLng(30.062135, 31.249990), id: '5');
  PlaceModel home = PlaceModel(
      name: 'Home',
      latLng: const LatLng(26.645969640792927, 31.727376875776454),
      id: '6');

  void initMarkers() {

    var list = places
        .map((place) => Marker(
        onTap: (){
          debugPrint("tapped on ${place.name}");
          mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: place.latLng, zoom: 17,
              ),), );
        },
              markerId: MarkerId(place.id),
              position: place.latLng,
              infoWindow: InfoWindow(
                title: place.name,
                onTap: (){
                  debugPrint("tapped on ${place.name}");
                  mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: place.latLng, zoom: 17, ),), );
                }
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
            ))
        .toSet();
    markers.addAll(list);
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    initMarkers();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: currentLocation,
          zoom: 11.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    places = {GeeksHub, cairoStadium, alexandria, alexandria2, alexandria3};

    initMarkers();

    _initializeLocationService();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    initMarkers();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: currentLocation,
          zoom: 11.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentLocation == null) {
      _initializeLocationService();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.terrain,
            myLocationEnabled: true,

            markers: markers,

            onMapCreated: _onMapCreated,

            key: const Key('AIzaSyD-nqca1whjUlkEcMPUDPM7UxZ6fUj4BIw'),
            initialCameraPosition: CameraPosition(
              target: GeeksHub.latLng,
              zoom: 11.0,
            ),
          ),
        ),
      ),
    );
  }
}
