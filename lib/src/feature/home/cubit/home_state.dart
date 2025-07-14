import 'package:city17/src/feature/home/model/income_model.dart';

abstract class HomeState {}

class initialstat extends HomeState {}

class Textuldata extends HomeState {}

class dataloadedstate extends HomeState {
  final double values;
  final double percentage;

  dataloadedstate(this.values, this.percentage);
}

class chartdatasate extends HomeState {
  final List<IncomeModel> totalincome;
  final List<ChartData> data;
  String values;

  chartdatasate(this.values, this.data, this.totalincome);
}

class datafailurestate extends HomeState {}
