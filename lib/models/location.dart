import 'package:geolocator/geolocator.dart';

Future<Position?> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, return null
    return null;
  }

  // Check for location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Request permission if it is denied
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, return null
      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are permanently denied, return null
    return null;
  }

  // When permissions are granted, get the position
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
