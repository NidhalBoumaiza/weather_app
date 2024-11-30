import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<dynamic> getLocation() async {
  double lattitude = 0.0;
  double longitude = 0.0;
  bool isServiceEnabled;
  LocationPermission locationPermission;

  isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  // status of permission
  locationPermission = await Geolocator.checkPermission();

  if (locationPermission == LocationPermission.deniedForever) {
    return Future.error("Location permission are denied forever");
  } else if (locationPermission == LocationPermission.denied) {
    // request permission
    locationPermission = await Geolocator.requestPermission();
    if (locationPermission == LocationPermission.denied) {
      return Future.error("Location permission is denied");
    }
  }
  return await GeolocatorPlatform.instance
      .getCurrentPosition()
      .then((value) {
    lattitude = value.latitude;
    longitude = value.longitude;
    return [lattitude, longitude];
  });
}


Future<String> GetAddressFromLatLong(lat, long) async {
  List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
  print(placemark);
  return placemark[0].subAdministrativeArea!;
}