import 'package:geolocator/geolocator.dart';

class UserCurrentLocUtils {
  bool? servicesEnable;

  Future<Position?> getUserCurrentLocation() async {
    try {
      servicesEnable = await Geolocator.isLocationServiceEnabled();

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {}

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return position;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
