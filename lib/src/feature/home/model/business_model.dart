import 'dart:convert';

import 'package:city17/src/feature/home/model/address_model.dart';

class BusinessModel {
  final String id;
  final String name;
  //  final AddressModel addressModel;

  final String category;
  // final DateTime createdAt;
  BusinessModel({
    required this.id,
    required this.name,
    // required this.addressModel,
    required this.category,
    // required this.createdAt,
  });

  BusinessModel copyWith({
    String? id,
    String? name,
    AddressModel? addressModel,
    String? category,
    DateTime? createdAt,
  }) {
    return BusinessModel(
      id: id ?? this.id,
      name: name ?? this.name,
      //  addressModel: addressModel ?? this.addressModel,
      category: category ?? this.category,
      // createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      // 'addressModel': addressModel.toMap(),
      'category': category,
      // 'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  // factory BusinessModel.fromMap(Map<String, dynamic> map) {
  //   return BusinessModel(
  //     id: map['_id'] as String,
  //     name: map['name'] as String,
  //     addressModel: AddressModel.fromMap(map['addressModel']),
  //     category: map['category'] as String,
  //     createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
  //   );
  // }

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      //  addressModel: AddressModel.fromMap(map['addressModel']),
      category: map['category'] ?? '',
      //createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 24),
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessModel.fromJson(String source) =>
      BusinessModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
