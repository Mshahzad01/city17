import 'dart:convert';

import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:city17/src/feature/home/model/displays_model.dart';

class ResponseBussinessModel {
  final String id;
  final String name;
  final AddressModel? address;

  final String category;
  final DateTime createdAt;
  ResponseBussinessModel({
    required this.id,
    required this.name,
    this.address,

    required this.category,
    required this.createdAt,
  });

  ResponseBussinessModel copyWith({
    String? id,
    String? name,
    AddressModel? address,
    List<DisplaysModel>? displays,
    String? category,
    DateTime? createdAt,
  }) {
    return ResponseBussinessModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,

      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,

      'category': category,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ResponseBussinessModel.fromMap(Map<String, dynamic> map) {
    return ResponseBussinessModel(
      id: map['_id'],
      name: map['name'],
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'])
          : null,

      category: map['category'],
      createdAt: DateTime.tryParse(map['createdAt']) ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseBussinessModel.fromJson(String source) =>
      ResponseBussinessModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
