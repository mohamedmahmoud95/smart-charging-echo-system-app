import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(30.06618986506241, 31.278404555992157);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            key: const Key('AIzaSyD-nqca1whjUlkEcMPUDPM7UxZ6fUj4BIw'),
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
        ),
      ),
    );
  }
}
