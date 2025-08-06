import 'dart:convert';

import 'package:city17/src/core/enum/enum_method.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/auth/model/auth_response.dart';
import 'package:city17/src/feature/connect_display/enum/displaylocation_enum.dart';
import 'package:city17/src/feature/connect_display/enum/screen_installed_enum.dart';
import 'package:city17/src/feature/home/enum/layout_enum.dart';
import 'package:city17/src/feature/home/model/address_model.dart';

class CreateDisplayModel {
  final String? id;
  final String? name;
  final String? loaction;
  final LayoutEnum? layout;
  final double? displaySize;
  final String? businessId;
  final String? userId;
  final DeviceInfo? deviceInfo;
  final String? firebaseId;
  final AddressModel? addressModel;
  final String? image;
  final String? placement;
  final IAmount? pricing;
  final DisplayLocationType? offerType;
  final ScreenInstallEnum? screenType;
  final String? description;

  // class CreateObjModel {
  //   final double displaySize;
  //   final ScreenAppearanceModel screenAppearance;
  //   final String name;
  //   final String offerType; // 'fixed' or 'bid'
  //   final String category;
  //   final List<DateTime> ownAdvertisementHours;
  //   final String description;
  //   final String screenType;
  //   final String placement;
  //   final String location;
  //   final String businessId;
  //   final String firebaseId;
  //   final DeviceInfoModel deviceInfo;
  //   final String userId;
  //   final String image;
  //   final String layout;
  //   final AddressModel? address;
  //   final PricingModel pricing;

  CreateDisplayModel({
    this.pricing,
    this.placement,
    this.id,
    this.name,
    this.loaction,
    this.layout,
    this.displaySize,
    this.businessId,
    this.userId,
    this.deviceInfo,
    this.firebaseId,
    this.addressModel,
    this.image,
    this.offerType,
    this.screenType,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'loaction': loaction,
      'layout': enumToString(layout),
      'displaySize': displaySize,
      'businessId': businessId,

      'userId': userId,

      'deviceInfo': deviceInfo?.toMap(),
      'firebaseId': firebaseId,

      'addressModel': addressModel?.toMap(),

      'image': image,
      'placement': placement,
      'pricing': pricing,
      'layoutEnum': enumToString(layout),
      'offerType': enumToString(offerType),
      'screenType': enumToString(screenType),
      'description': description,
    };
  }

  static CreateDisplayModel? fromMap(Map<String, dynamic>? map) {
    if (map == null || map.isEmpty) {
      return null;
    }

    return CreateDisplayModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      loaction: map['loaction'] ?? '',
      layout:
          enumFromString(map['layout'], LayoutEnum.values) ??
          LayoutEnum.horizantal,
      displaySize: (map['displaySize'] ?? 20).toDouble(),
      businessId: map['businessId'] ?? '',

      userId: map['userId'] ?? '',

      deviceInfo: map['deviceInfo'] != null
          ? DeviceInfo.fromMap(map['deviceInfo'])
          : null,
      firebaseId: map['firebaseId'] ?? '',

      addressModel: map['addressModel'] != null
          ? AddressModel.fromMap(map['addressModel'])
          : null,
      image: map['image'] ?? '',
      placement: map['placement'] ?? '',
      pricing: map['pricing'] != null ? IAmount.fromMap(map['pricing']) : null,
      offerType:
          enumFromString(map['offerType'], DisplayLocationType.values) ??
          DisplayLocationType.mobile,

      screenType:
          enumFromString(map['screenType'], ScreenInstallEnum.values) ??
          ScreenInstallEnum.resturent,

      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  //   factory CreateDisplayModel.fromJson(String source) =>
  //       CreateDisplayModel.fromMap(json.decode(source) as Map<String, dynamic>);
}







   











            //        "displays": [
            //     {
            //         "_id": "6833c363b405861c7516e8e1",
            //         "name": "Leura Thai House 1",
            //         "location": "onTheShopWindow",
            //         "layout": "vertical",
            //         "displaySize": 50,
            //         "businessId": "6833c31cb405861c7516e8c6",
            //         "lastHeartbeat": "2025-08-04T10:28:16.777Z",
            //         "userId": "66a3771271117c91b6f9cbd3",
            //         "hasOwnAdvertisement": true,
            //         "deviceInfo": {
            //             "id": "4dfbe48d-0690-4252-81f1-c4467cd05d28",
            //             "brand": "JVC",
            //             "device": "guandu",
            //             "display": "RTM7.230903.126",
            //             "manufacturer": "Expressluck",
            //             "model": "JVC 4K Android TV",
            //             "product": "JVC_4K_ATV2_1",
            //             "type": "user",
            //             "isPhysicalDevice": true,
            //             "displayMetrics": {
            //                 "widthPx": 1920,
            //                 "heightPx": 1080,
            //                 "xDpi": 52,
            //                 "yDpi": 52
            //             },
            //             "serialNumber": "unknown"
            //         },
            //         "firebaseId": "cFGluyFHFlQW7cdBzFBmYn2N1v53",
            //         "isOnline": true,
            //         "address": {
            //             "formattedAddress": "130 Megalong St, Leura NSW 2780, Australia",
            //             "latitude": -33.7138909,
            //             "longitude": 150.3302358,
            //             "country": "Australia",
            //             "isoCode": "AU",
            //             "state": "New South Wales",
            //             "city": "Leura",
            //             "coordinates": [
            //                 150.3302358,
            //                 -33.7138909
            //             ],
            //             "type": "Point"
            //         },
            //         "ownAdvertisements": [
            //             {
            //                 "url": "https://res.cloudinary.com/dkxene4jv/video/upload/v1748223797/City17/eut1roef5fp44bmmp5wq.mp4",
            //                 "layout": "vertical",
            //                 "_id": "6833c739b405861c7516ea5c"
            //             },
            //             {
            //                 "url": "https://res.cloudinary.com/dkxene4jv/video/upload/v1748494629/City17/plopzdffnqnnzuzsvww2.mp4",
            //                 "layout": "vertical",
            //                 "_id": "6837e928b405861c75189410"
            //             },
            //             {
            //                 "url": "https://res.cloudinary.com/dkxene4jv/video/upload/v1748495098/City17/gggyka0et35yw6fo8ums.mp4",
            //                 "layout": "vertical",
            //                 "_id": "6837eafeb405861c75189567"
            //             },
            //             {
            //                 "url": "https://res.cloudinary.com/dkxene4jv/video/upload/v1748495171/City17/yckwv0zdnhyzrhsip8ei.mp4",
            //                 "layout": "vertical",
            //                 "_id": "6837eb45b405861c7518958f"
            //             }
            //         ],
            //         "createdAt": "2025-05-26T01:26:59.707Z",
            //         "updatedAt": "2025-08-04T10:28:16.777Z",
            //         "__v": 2,
            //         "image": "https://res.cloudinary.com/dkxene4jv/image/upload/v1748222880/City17/byjzpdonounin2a0eb5l.jpg",
            //         "lastHeartbeatConfig": {
            //             "offlineNotificationSent": false,
            //             "onlineNotificationSent": false,
            //             "offlineNotificationSentAt": "2025-07-10T05:15:01.301Z"
            //         },
            //         "fixedCampaignTimeSpans": [],
            //         "ownAdvertisementHours": [],
            //         "pricingPreferences": {
            //             "allowBidOffer": true,
            //             "allowFixedOffer": true
            //         },
            //         "offerType": "fixed"
            //     }
            // ]