import 'dart:convert';

import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:city17/src/feature/home/model/displays_model.dart';

class BusinessModel {
  final String id;
  final String name;
  final AddressModel? address;
  final List<DisplaysModel> displays;
  final String category;
  final DateTime createdAt;
  BusinessModel({
    required this.id,
    required this.name,
    this.address,
    required this.displays,
    required this.category,
    required this.createdAt,
  });

  BusinessModel copyWith({
    String? id,
    String? name,
    AddressModel? address,
    List<DisplaysModel>? displays,
    String? category,
    DateTime? createdAt,
  }) {
    return BusinessModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      displays: displays ?? this.displays,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address?.toMap(),
      'displays': displays.map((x) => x.toMap()).toList(),
      'category': category,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      id: map['_id'],
      name: map['name'],
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'])
          : null,

      category: map['category'],
      createdAt: DateTime.tryParse(map['createdAt']) ?? DateTime.now(),

      displays: (map['displays'] as List)
          .map((x) => DisplaysModel.fromMap(x as Map<String, dynamic>))
          .whereType<DisplaysModel>()
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessModel.fromJson(String source) =>
      BusinessModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
