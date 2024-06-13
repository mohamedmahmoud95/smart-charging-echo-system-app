import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class LocationUtilityFunctions {
  Location _location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  Future<void> initialize() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Stream<LocationData> getLocationUpdates() {
    return _location.onLocationChanged;

  }

  Future<LocationData?> getCurrentLocation() async {
    return await _location.getLocation();
  }
}
