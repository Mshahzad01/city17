import 'dart:async';
import 'dart:io';

import 'package:city17/src/core/utils/flutter_toast_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocatorService {
  GeolocatorService._singleton() {
    _streamController = StreamController<Position>.broadcast();
  }

  static GeolocatorService instance = GeolocatorService._singleton();

  late StreamController<Position> _streamController;

  Stream<Position> get positionStream => _streamController.stream;

  Position _currentPosition = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    altitudeAccuracy: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  Position get currentPosition => _currentPosition;

  LatLng? get latLng => validate
      ? LatLng(currentPosition.latitude, currentPosition.longitude)
      : null;

  DateTime? lastRequestTime;

  bool get validate =>
      currentPosition.latitude != 0 && currentPosition.longitude != 0;

  //Boolean to check if the startUpdateMyLoc function has been called;
  // ignore: unused_field
  bool _isUpdating = false;

  Future startUpdatingMyLoc() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        unawaited(ToastUtils.errorToast('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      unawaited(
        ToastUtils.errorToast(
          'Location permissions are permanently denied, we cannot request permissions.',
        ),
      );
    }

    _currentPosition =
        (await Geolocator.getLastKnownPosition()) ??
        await Geolocator.getCurrentPosition();

    _isUpdating = true;

    final Stream<Position> positionStream = Geolocator.getPositionStream(
      locationSettings: Platform.isAndroid
          ? AndroidSettings(
              accuracy: LocationAccuracy.high,
              intervalDuration: const Duration(seconds: 10),
              distanceFilter: 100,
            )
          : const LocationSettings(
              accuracy: LocationAccuracy.high,
              distanceFilter: 100,
            ),
    );

    positionStream.listen((Position position) {
      if ([position.longitude, position.latitude].contains(null)) return;
      _currentPosition = position;
      _streamController.add(position);
    });
  }
}
