import 'package:city17/src/feature/home/model/income_model.dart';

abstract class HomeState {}

class Initialstat extends HomeState {}

class Textuldata extends HomeState {}

class Dataloadedstate extends HomeState {
  final double values;
  final double percentage;

  Dataloadedstate(this.values, this.percentage);
}

class Chartdatasate extends HomeState {
  final List<IncomeModel> totalincome;
  final List<ChartData> data;
  IncomeType values;

  Chartdatasate(this.values, this.data, this.totalincome);
}
