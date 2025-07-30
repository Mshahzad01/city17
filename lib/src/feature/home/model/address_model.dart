import 'dart:convert';

class AddressModel {
  final String formattedAddress;
  final double latitude;
  final double logitude;
  final String country;

  final String isoCode;
  final String state;

  final String city;

  final List<double> coordinates;
  final String type;
  AddressModel({
    required this.formattedAddress,
    required this.latitude,
    required this.logitude,
    required this.country,
    required this.isoCode,
    required this.state,
    required this.city,
    required this.coordinates,
    required this.type,
  });

  AddressModel copyWith({
    String? formattedAddress,
    double? latitude,
    double? logitude,
    String? country,
    String? isoCode,
    String? state,
    String? city,
    List<double>? coordinates,
    String? type,
  }) {
    return AddressModel(
      formattedAddress: formattedAddress ?? this.formattedAddress,
      latitude: latitude ?? this.latitude,
      logitude: logitude ?? this.logitude,
      country: country ?? this.country,
      isoCode: isoCode ?? this.isoCode,
      state: state ?? this.state,
      city: city ?? this.city,
      coordinates: coordinates ?? this.coordinates,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formattedAddress': formattedAddress,
      'latitude': latitude,
      'logitude': logitude,
      'country': country,
      'isoCode': isoCode,
      'state': state,
      'city': city,
      'coordinates': coordinates,
      'type': type,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      formattedAddress: map['formattedAddress'] as String,
      latitude: map['latitude'] as double,
      logitude: map['logitude'] as double,
      country: map['country'] as String,
      isoCode: map['isoCode'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      coordinates: List<double>.from((map['coordinates'] as List<double>)),
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
