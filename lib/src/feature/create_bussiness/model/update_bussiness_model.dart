import 'dart:convert';

import 'package:city17/src/core/enum/enum_method.dart';
import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:city17/src/feature/home/model/displays_model.dart';
import 'package:city17/src/feature/location_setting/enum/business_category_enum.dart';

class UpdateBussinessModel {
  final String businessId;
  final String name;
  final AddressModel? address;

  final BusinessCategoryEnum category;
  final DateTime createdAt;
  UpdateBussinessModel({
    required this.businessId,
    required this.name,
    this.address,

    required this.category,
    required this.createdAt,
  });

  UpdateBussinessModel copyWith({
    String? businessId,
    String? name,
    AddressModel? address,
    List<DisplaysModel>? displays,
    BusinessCategoryEnum? category,
    DateTime? createdAt,
  }) {
    return UpdateBussinessModel(
      name: name ?? this.name,
      address: address ?? this.address,

      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      businessId: businessId ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'businessId': businessId,
      'name': name,

      'category': enumToString(category),
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory UpdateBussinessModel.fromMap(Map<String, dynamic> map) {
    return UpdateBussinessModel(
      businessId: map['businessId'],
      name: map['name'],
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'])
          : null,

      category:
          enumFromString(map['category'], BusinessCategoryEnum.values) ??
          BusinessCategoryEnum.returent,
      createdAt: DateTime.tryParse(map['createdAt']) ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateBussinessModel.fromJson(String source) =>
      UpdateBussinessModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
