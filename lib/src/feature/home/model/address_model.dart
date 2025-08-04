import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';



class AddressModel {
  AddressModel({
    required this.formattedAddress,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.isoCode,
    required this.state,
    required this.city,
    required this.coordinates,
  });

  static AddressModel? fromMap(map) {
    if (map == null || map.isEmpty) {
      return null;
    }





    if ([map['coordinates'], map['latitude'], map['longitude']]
        .contains(null)) {
      return null;
    }

    return AddressModel(
      formattedAddress: map['formattedAddress'] ?? '',
      latitude: map['latitude'] ?? 0.0,
      longitude: map['longitude'] ?? 0.0,
      country: map['country'] ?? '',
      isoCode: map['isoCode'] ?? '',
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      coordinates: List<num>.from(map['coordinates']),
    );
  }

  final String formattedAddress;
  final num latitude;
  final num longitude;
  final String country;
  final String isoCode;
  final String state;
  final String city;
  final List<num> coordinates;

  AddressModel copyWith({
    String? formattedAddress,
    double? latitude,
    double? longitude,
    String? country,
    String? isoCode,
    String? state,
    String? city,
    List<num>? coordinates,
  }) {
    return AddressModel(
      formattedAddress: formattedAddress ?? this.formattedAddress,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      country: country ?? this.country,
      isoCode: isoCode ?? this.isoCode,
      state: state ?? this.state,
      city: city ?? this.city,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  LatLng get latLng => LatLng(latitude.toDouble(), longitude.toDouble());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formattedAddress': formattedAddress,
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'isoCode': isoCode,
      'state': state,
      'city': city,
      'coordinates': coordinates,
    };
  }

  String toJson() => json.encode(toMap());
}
