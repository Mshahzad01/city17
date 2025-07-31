// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:city17/src/core/enum/enum_method.dart';
import 'package:city17/src/feature/auth/model/auth_response.dart';
import 'package:city17/src/feature/home/enum/layout_enum.dart';
import 'package:city17/src/feature/home/model/address_model.dart';

class DisplaysModel {
  final String id;
  final String name;
  final String loaction;
  final LayoutEnum layout;
  final double displaySize;
  final String businessId;
  final DateTime lastHeartbeat;
  final String userId;
  final bool hasownAdvertisement;
  final DeviceInfo? deviceInfo;
  final String firebaseId;
  final bool isOnline;
  final AddressModel? addressModel;
  final List<OwnAdvertismentsModel> ownadvertisments;
  final String createdAt;
  final String updatedAt;
  final String image;
  DisplaysModel({
    required this.id,
    required this.name,
    required this.loaction,
    required this.layout,
    required this.displaySize,
    required this.businessId,
    required this.lastHeartbeat,
    required this.userId,
    required this.hasownAdvertisement,
    required this.deviceInfo,
    required this.firebaseId,
    required this.isOnline,
    this.addressModel,
    required this.ownadvertisments,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  DisplaysModel copyWith({
    String? id,
    String? name,
    String? loaction,
    LayoutEnum? layout,
    double? displaySize,
    String? businessId,
    DateTime? lastHeartbeat,
    String? userId,
    bool? hasownAdvertisement,
    DeviceInfo? deviceInfo,
    String? firebaseId,
    bool? isOnline,
    AddressModel? addressModel,
    List<OwnAdvertismentsModel>? ownadvertisments,
    String? createdAt,
    String? updatedAt,
    String? image,
  }) {
    return DisplaysModel(
      id: id ?? this.id,
      name: name ?? this.name,
      loaction: loaction ?? this.loaction,
      layout: layout ?? this.layout,
      displaySize: displaySize ?? this.displaySize,
      businessId: businessId ?? this.businessId,
      lastHeartbeat: lastHeartbeat ?? this.lastHeartbeat,
      userId: userId ?? this.userId,
      hasownAdvertisement: hasownAdvertisement ?? this.hasownAdvertisement,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      firebaseId: firebaseId ?? this.firebaseId,
      isOnline: isOnline ?? this.isOnline,
      addressModel: addressModel ?? this.addressModel,
      ownadvertisments: ownadvertisments ?? this.ownadvertisments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'loaction': loaction,
      'layout': enumToString(layout),
      'displaySize': displaySize,
      'businessId': businessId,
      'lastHeartbeat': lastHeartbeat.millisecondsSinceEpoch,
      'userId': userId,
      'hasownAdvertisement': hasownAdvertisement,
      'deviceInfo': deviceInfo?.toMap(),
      'firebaseId': firebaseId,
      'isOnline': isOnline,
      'addressModel': addressModel?.toMap(),
      'ownadvertisments': ownadvertisments.map((x) => x.toMap()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'image': image,
    };
  }

  static DisplaysModel? fromMap(Map<String, dynamic>? map) {
    if (map == null || map.isEmpty) {
      return null;
    }
    //factory DisplaysModel.fromMap(Map<String, dynamic> map) {
    return DisplaysModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      loaction: map['loaction'] ?? '',
      layout:
          enumFromString(map['layout'], LayoutEnum.values) ??
          LayoutEnum.horizantal,
      displaySize: (map['displaySize'] ?? 20).toDouble(),
      businessId: map['businessId'] ?? '',
      lastHeartbeat:
          DateTime.tryParse(map['lastHeartbeat']?.toString() ?? '') ??
          DateTime.now(),
      userId: map['userId'] ?? '',
      hasownAdvertisement: map['hasownAdvertisement'] ?? false,
      deviceInfo: map['deviceInfo'] != null
          ? DeviceInfo.fromMap(map['deviceInfo'])
          : null,
      firebaseId: map['firebaseId'] ?? '',
      isOnline: map['isOnline'] ?? false,
      addressModel: map['addressModel'] != null
          ? AddressModel.fromMap(map['addressModel'])
          : null,
      ownadvertisments: map['ownadvertisments'] != null
          ? List<OwnAdvertismentsModel>.from(
              (map['ownadvertisments'] as List).map(
                (x) => OwnAdvertismentsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  //   factory DisplaysModel.fromJson(String source) =>
  //       DisplaysModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OwnAdvertismentsModel {
  final String url;
  final LayoutEnum layout;
  final String id;
  OwnAdvertismentsModel({
    required this.url,
    required this.layout,
    required this.id,
  });

  OwnAdvertismentsModel copyWith({
    String? url,
    LayoutEnum? layout,
    String? id,
  }) {
    return OwnAdvertismentsModel(
      url: url ?? this.url,
      layout: layout ?? this.layout,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'layout': enumToString(layout),
      'id': id,
    };
  }

  factory OwnAdvertismentsModel.fromMap(Map<String, dynamic> map) {
    return OwnAdvertismentsModel(
      url: map['url'] as String,
      layout:
          enumFromString(map['layout'], LayoutEnum.values) ??
          LayoutEnum.horizantal,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OwnAdvertismentsModel.fromJson(String source) =>
      OwnAdvertismentsModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

class LastHeartbeatConfig {
  final bool offlineNotificationSent;
  final bool onlineNotficationSent;
  final DateTime offlineNotficationSentAt;
  LastHeartbeatConfig({
    required this.offlineNotificationSent,
    required this.onlineNotficationSent,
    required this.offlineNotficationSentAt,
  });
}
