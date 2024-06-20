import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Set<Marker> markers = {};
  Set<PlaceModel> places = {};
  late BitmapDescriptor customIcon;
  bool isAddingMarker = false; // Flag to check if adding a marker is enabled

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

  @override
  void initState() {
    super.initState();
    places = {GeeksHub, cairoStadium, alexandria, alexandria2, alexandria3};

    _initializeLocationService();
    _loadCustomMarkerIcon();
  }

  Future<void> _loadCustomMarkerIcon() async {
    final ByteData byteData = await rootBundle.load('assets/images/custom_marker2.png');
    final ui.Codec codec = await ui.instantiateImageCodec(
      byteData.buffer.asUint8List(),
      targetWidth: 150,
      targetHeight: 150,
    );
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? resizedByteData =
    await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List resizedBytes = resizedByteData!.buffer.asUint8List();

    setState(() {
      customIcon = BitmapDescriptor.fromBytes(resizedBytes);
      initMarkers(); // Initialize markers after loading the custom icon
    });
  }

  Future<void> _initializeLocationService() async {
    bool granted = await PermissionService.requestLocationPermission();

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

  void initMarkers() {
    if (customIcon != null) {
      var list = places
          .map((place) => Marker(
        onTap: () {
          debugPrint("tapped on ${place.name}");
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: place.latLng,
                zoom: 17,
              ),
            ),
          );
        },
        markerId: MarkerId(place.id),
        position: place.latLng,
        infoWindow: InfoWindow(
          title: place.name,
          onTap: () {
            debugPrint("tapped on ${place.name}");
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: place.latLng,
                  zoom: 17,
                ),
              ),
            );
          },
        ),
        icon: customIcon,
      ))
          .toSet();
      markers.addAll(list);
    }
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

  void _enableAddMarkerMode() {
    setState(() {
      isAddingMarker = true;
    });
  }

  void _addMarker(LatLng position) {
    final String markerId = position.toString();
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(markerId),
          position: position,
          icon: customIcon,
          infoWindow: const InfoWindow(
            title: 'New charging station',
          ),
          onTap: () {
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 17,
                ),
              ),
            );
          },

        ),
      );
      isAddingMarker = false; // Disable marker adding mode
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentLocation == null) {
      _initializeLocationService();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our stations'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_location),
            onPressed: _enableAddMarkerMode,
            tooltip: 'Add New Mark',
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.terrain,
            myLocationEnabled: true,
            markers: markers,
            onMapCreated: onMapCreated,
            onTap: isAddingMarker ? _addMarker : null, // Enable marker adding only when adding mode is enabled
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
