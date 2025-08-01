import 'dart:convert';

import 'package:city17/src/core/enum/enum_method.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/location_setting/enum/display_status_enum.dart';

class BussinessOverviewModel {
  final List<DisplaysOverview> displays;
  final int count;
  final DisplaysStatus status;
  BussinessOverviewModel({
    required this.displays,
    required this.count,
    required this.status,
  });

  BussinessOverviewModel copyWith({
    List<DisplaysOverview>? displays,
    int? count,
    DisplaysStatus? status,
  }) {
    return BussinessOverviewModel(
      displays: displays ?? this.displays,
      count: count ?? this.count,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displays': displays.map((x) => x.toMap()).toList(),
      'count': count,
      'status': enumToString(status),
    };
  }

  factory BussinessOverviewModel.fromMap(Map<String, dynamic> map) {
    return BussinessOverviewModel(
      displays: List<DisplaysOverview>.from(
        (map['displays']).map<DisplaysOverview>(
          (x) => DisplaysOverview.fromMap(x as Map<String, dynamic>),
        ),
      ),
      count: map['count'],
      status:
          enumFromString(map['status'], DisplaysStatus.values) ??
          DisplaysStatus.online,
    );
  }

  String toJson() => json.encode(toMap());

  factory BussinessOverviewModel.fromJson(String source) =>
      BussinessOverviewModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

class DisplaysOverview {
  final String id;
  final String name;
  final IAmount revenue;
  final double uptime;
  final Bussiness bussiness;
  final int campaignsThisWeek;
  DisplaysOverview({
    required this.id,
    required this.name,
    required this.revenue,
    required this.uptime,
    required this.bussiness,
    required this.campaignsThisWeek,
  });

  DisplaysOverview copyWith({
    String? id,
    String? name,
    IAmount? revenue,
    double? uptime,
    Bussiness? bussiness,
    int? campaignsThisWeek,
  }) {
    return DisplaysOverview(
      id: id ?? this.id,
      name: name ?? this.name,
      revenue: revenue ?? this.revenue,
      uptime: uptime ?? this.uptime,
      bussiness: bussiness ?? this.bussiness,
      campaignsThisWeek: campaignsThisWeek ?? this.campaignsThisWeek,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'revenue': revenue.toMap(),
      'uptime': uptime,
      'bussiness': bussiness.toMap(),
      'campaignsThisWeek': campaignsThisWeek,
    };
  }

  // factory DisplaysOverview.fromMap(Map<String, dynamic> map) {
  //   return DisplaysOverview(
  //     id: map['_id'] as String,
  //     name: map['name'] as String,
  //     revenue: IAmount.fromMap(map['revenue'] as Map<String, dynamic>),
  //     uptime: map['uptime'] as double,
  //     bussiness: Bussiness.fromMap(map['bussiness'] as Map<String, dynamic>),
  //     campaignsThisWeek: map['campaignsThisWeek'] as double,
  //   );
  // }

  factory DisplaysOverview.fromMap(Map<String, dynamic> map) {
    return DisplaysOverview(
      id: map['_id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      revenue: map['revenue'] != null && map['revenue'] is Map
          ? IAmount.fromMap(map['revenue'] as Map<String, dynamic>)
          : IAmount(amount: 0, currency: 'PKR'), // fallback
      uptime: (map['uptime'] is num) ? (map['uptime'] as num).toDouble() : 0.0,
      bussiness: map['bussiness'] != null && map['bussiness'] is Map
          ? Bussiness.fromMap(map['bussiness'] as Map<String, dynamic>)
          : Bussiness(name: '', city: ''),
      campaignsThisWeek: (map['campaignsThisWeek'] is num)
          ? (map['campaignsThisWeek'] as num).toInt()
          : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplaysOverview.fromJson(String source) =>
      DisplaysOverview.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Bussiness {
  String name;
  String city;
  Bussiness({required this.name, required this.city});

  Bussiness copyWith({String? name, String? city}) {
    return Bussiness(name: name ?? this.name, city: city ?? this.city);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'city': city};
  }

  // factory Bussiness.fromMap(Map<String, dynamic> map) {
  //   return Bussiness(name: map['name'] as String, city: map['city'] as String);
  // }
  factory Bussiness.fromMap(Map<String, dynamic> map) {
    return Bussiness(
      name: map['name']?.toString() ?? '',
      city: map['city']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Bussiness.fromJson(String source) =>
      Bussiness.fromMap(json.decode(source) as Map<String, dynamic>);
}
