import 'package:city17/src/core/model/my_exception.dart';
import 'package:city17/src/core/utils/log_utils.dart';
import 'package:city17/src/feature/geocode/networks/geocode_src.dart';
import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class _GeocodeRepo {
  Future<AddressModel> addressFromCoords(LatLng coords);
}

class GeoCodeRepo implements _GeocodeRepo {
 GeoCodeRepo() {
    geocodeSrc = GeocodeSrc();
  }

  late GeocodeSrc geocodeSrc;
  @override
  Future<AddressModel> addressFromCoords(LatLng coords) async {
    final res = await geocodeSrc.getAddressFromCoords(coords);

    LogUtils.printLog(['...........Address From Coords', res.data]);

    if (res.data['success']) {
      return AddressModel.fromMap(res.data['response'])!;
    }
    throw MyException(res.data['message']);
  }
}
