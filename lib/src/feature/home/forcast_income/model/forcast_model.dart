import 'dart:convert';

import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';

class ForcastModel {
  // final Period day;
  // final Period week;
  // final Period month;
  final SummaryModel summary;
  ForcastModel({
    // required this.day,
    // required this.week,
    // required this.month,
    required this.summary,
  });

  ForcastModel copyWith({
    // Period? day,
    // Period? week,
    // Period? month,
    SummaryModel? summary,
  }) {
    return ForcastModel(
      // day: day ?? this.day,
      // week: week ?? this.week,
      // month: month ?? this.month,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'day': day.toMap(),
      // 'week': week.toMap(),
      // 'month': month.toMap(),
      'summary': summary.toMap(),
    };
  }

  factory ForcastModel.fromMap(Map<String, dynamic> map) {
    return ForcastModel(
      // day: Period.fromMap(map['day'] as Map<String, dynamic>),
      // week: Period.fromMap(map['week'] as Map<String, dynamic>),
      // month: Period.fromMap(map['month'] as Map<String, dynamic>),
      summary: SummaryModel.fromMap(map['summary'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForcastModel.fromJson(String source) =>
      ForcastModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Period {
  final String range;
  final IAmount total;
  final double potChange;
  final String currency;
  final List<PointsModel> points;
  final double min;
  final double max;
  Period({
    required this.range,
    required this.total,
    required this.potChange,
    required this.currency,
    required this.points,
    required this.min,
    required this.max,
  });

  Period copyWith({
    String? range,
    IAmount? total,
    double? potChange,
    String? currency,
    List<PointsModel>? points,
    double? min,
    double? max,
  }) {
    return Period(
      range: range ?? this.range,
      total: total ?? this.total,
      potChange: potChange ?? this.potChange,
      currency: currency ?? this.currency,
      points: points ?? this.points,
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'range': range,
      'total': total.toMap(),
      'potChange': potChange,
      'currency': currency,
      'points': points.map((x) => x.toMap()).toList(),
      'min': min,
      'max': max,
    };
  }

  factory Period.fromMap(Map<String, dynamic> map) {
    return Period(
      range: map['range'] as String,

      total: IAmount.fromMap(map['total']),
      potChange: map['potChange'] as double,
      currency: map['currency'] as String,

      points: List<PointsModel>.from(
        (map['points'] as List).map<PointsModel>(
          (x) => PointsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),

      min: map['min'] as double,
      max: map['max'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Period.fromJson(String source) =>
      Period.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PointsModel {
  final DateTime date;
  final double label;
  final double value;
  PointsModel({required this.date, required this.label, required this.value});

  PointsModel copyWith({DateTime? date, double? label, double? value}) {
    return PointsModel(
      date: date ?? this.date,
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'label': label,
      'value': value,
    };
  }

  factory PointsModel.fromMap(Map<String, dynamic> map) {
    return PointsModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      label: map['label'] as double,
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PointsModel.fromJson(String source) =>
      PointsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SummaryModel {
  final IAmount daily;
  final IAmount weekly;
  final IAmount yearly;
  SummaryModel({
    required this.daily,
    required this.weekly,
    required this.yearly,
  });

  SummaryModel copyWith({IAmount? daily, IAmount? weekly, IAmount? yearly}) {
    return SummaryModel(
      daily: daily ?? this.daily,
      weekly: weekly ?? this.weekly,
      yearly: yearly ?? this.yearly,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'daily': daily.toMap(),
      'weekly': weekly.toMap(),
      'yearly': yearly.toMap(),
    };
  }

  factory SummaryModel.fromMap(Map<String, dynamic> map) {
    return SummaryModel(
      daily: IAmount.fromMap(map['daily'] as Map<String, dynamic>),
      weekly: IAmount.fromMap(map['weekly'] as Map<String, dynamic>),
      yearly: IAmount.fromMap(map['yearly'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryModel.fromJson(String source) =>
      SummaryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
