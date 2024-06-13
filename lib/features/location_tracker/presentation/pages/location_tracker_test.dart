import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../location_utility_functions/location_permissions_service.dart';
import '../../location_utility_functions/loction_utility_functions.dart';

class  LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final LocationUtilityFunctions _locationService = LocationUtilityFunctions();
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _initializeLocationService();
  }
  @override
  void dispose() {
    super.dispose();
  }

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
                "current location: ${locationData.latitude}, ${locationData
                    .longitude}");
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentLocation == null)
      {
        _initializeLocationService();
      }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Tracker'),
      ),
      body: Center(
        child:
        _currentLocation == null
            ? const CircularProgressIndicator()
            :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Latitude: ${_currentLocation!.latitude}'),
            Text('Longitude: ${_currentLocation!.longitude}'),
          ],
        ),
      ),
    );
  }
}
