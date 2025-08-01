import 'dart:convert';

class DeviceInfoModel {
  final String id;
  final String brand;
  final String device;
  final String disply;
  final String manufacturer;
  final String model;
  final String product;
  final String type;

  final bool isPhysicalDevice;

  final int serialNumber;
  DeviceInfoModel({
    required this.id,
    required this.brand,
    required this.device,
    required this.disply,
    required this.manufacturer,
    required this.model,
    required this.product,
    required this.type,
    required this.isPhysicalDevice,

    required this.serialNumber,
  });

  DeviceInfoModel copyWith({
    String? id,
    String? brand,
    String? device,
    String? disply,
    String? manufacturer,
    String? model,
    String? product,
    String? type,
    bool? isPhysicalDevice,

    int? serialNumber,
  }) {
    return DeviceInfoModel(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      device: device ?? this.device,
      disply: disply ?? this.disply,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      product: product ?? this.product,
      type: type ?? this.type,
      isPhysicalDevice: isPhysicalDevice ?? this.isPhysicalDevice,

      serialNumber: serialNumber ?? this.serialNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brand': brand,
      'device': device,
      'disply': disply,
      'manufacturer': manufacturer,
      'model': model,
      'product': product,
      'type': type,
      'isPhysicalDevice': isPhysicalDevice,

      'serialNumber': serialNumber,
    };
  }

  factory DeviceInfoModel.fromMap(Map<String, dynamic> map) {
    return DeviceInfoModel(
      id: map['id'] as String,
      brand: map['brand'] as String,
      device: map['device'] as String,
      disply: map['disply'] as String,
      manufacturer: map['manufacturer'] as String,
      model: map['model'] as String,
      product: map['product'] as String,
      type: map['type'] as String,
      isPhysicalDevice: map['isPhysicalDevice'] as bool,

      serialNumber: map['serialNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceInfoModel.fromJson(String source) =>
      DeviceInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
