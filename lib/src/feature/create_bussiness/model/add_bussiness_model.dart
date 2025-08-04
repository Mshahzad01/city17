// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:city17/src/core/enum/enum_method.dart';

import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:city17/src/feature/location_setting/enum/business_category_enum.dart';

class AddBussinessModel {
  final String? name;
  final AddressModel? address;
  final BusinessCategoryEnum? category;
  AddBussinessModel({this.name, this.address, this.category});

  AddBussinessModel copyWith({
    String? name,
    AddressModel? address,
    BusinessCategoryEnum? category,
  }) {
    return AddBussinessModel(
      name: name ?? this.name,
      address: address ?? this.address,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address?.toMap(),
      'category': enumToString(category),
    };
  }

  factory AddBussinessModel.fromMap(Map<String, dynamic> map) {
    return AddBussinessModel(
      name: map['name'] ?? '',
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'])
          : null,
      category: map['category'] != null
          ? enumFromString(map['category'], BusinessCategoryEnum.values) ??
                BusinessCategoryEnum.returent
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddBussinessModel.fromJson(String source) =>
      AddBussinessModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
