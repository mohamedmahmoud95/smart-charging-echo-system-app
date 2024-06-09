import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status.isGranted;
  }

  static Future<bool> requestBackgroundLocationPermission() async {
    PermissionStatus status = await Permission.locationAlways.request();
    return status.isGranted;
  }
}
