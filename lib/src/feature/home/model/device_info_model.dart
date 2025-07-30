// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final DisplyMetrics displyMetrics;
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
    required this.displyMetrics,
    required this.serialNumber,
  });
}

class DisplyMetrics {
  final double widthPx;
  final double heightPx;
  final double xDpi;
  final double yDpi;
  DisplyMetrics({
    required this.widthPx,
    required this.heightPx,
    required this.xDpi,
    required this.yDpi,
  });
}
