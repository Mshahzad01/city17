import 'package:city17/src/services/api_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeocodeSrc {
  Future getAddressFromCoords(LatLng coords) async {
    final res = await APIServices.instance.request(
      '/geocode/address-from-coords',

      queryParam: {'latitude': coords.latitude, 'longitude': coords.longitude},
      DioMethod.get,
    );

    return res;
  }
}
