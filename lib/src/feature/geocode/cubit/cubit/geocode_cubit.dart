import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../networks/geocode_repo.dart';

part 'geocode_state.dart';

class GeocodeCubit extends Cubit<GeocodeState> {
  GeocodeCubit() : super(GeocodeInitial()) {
    _repo = GeoCodeRepo();
  }

  late GeoCodeRepo _repo;

  void cameraMoved() {
    emit(AddressFormatedCoord(address: null));
  }

  Future getAddressFromCoords(LatLng coords) async {
    emit(AddressFormatedCoord(address: null));

    try {
      final res = await _repo.addressFromCoords(coords);

      emit(AddressFormatedCoord(address: res));
    } catch (e) {
      emit(GeoCodeError(message: e.toString()));
      rethrow;
    }
  }
}
