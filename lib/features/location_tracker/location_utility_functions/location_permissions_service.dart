import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestLocationPermission() async {
    PermissionStatus status =// await Permission.location.request();
    await Permission.locationWhenInUse.request();
    return status == PermissionStatus.granted;
  }


  static Future<bool> requestBackgroundLocationPermission() async {
    PermissionStatus status = await Permission.locationAlways.request();
    return status.isGranted;
  }
}
