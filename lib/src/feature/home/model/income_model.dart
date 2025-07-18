enum IncomeType {
  day,
  week,
  month;

  String get title => switch (this) {
    day => 'Today',
    week => 'Week',
    month => 'Month',
  };

  static IncomeType fromTitle(String title) {
    switch (title) {
      case 'Today':
        return IncomeType.day;
      case 'Week':
        return IncomeType.week;
      case 'Month':
        return IncomeType.month;
      default:
        return IncomeType.day;
    }
  }
}

class IncomeModel {
  final double income;
  final IncomeType incomeType;

  final double percentage;
  // List<ChartData> chartData;

  IncomeModel({
    required this.income,
    required this.percentage,
    required this.incomeType,
  });
}

//dummy Data

List<IncomeModel> incomedata = [
  IncomeModel(income: 100.0, incomeType: IncomeType.day, percentage: 7.5),
  IncomeModel(income: 200.0, incomeType: IncomeType.week, percentage: 5.0),
  IncomeModel(income: 300.0, incomeType: IncomeType.month, percentage: 10.0),
];

List<ChartData> dayData = [
  ChartData('Mon', 10),
  ChartData('Tue', 20),
  ChartData('Wed', 30),
  ChartData('Thu', 20),
  ChartData('Fri', 80),
  ChartData('Sat', 35),
  ChartData('Sun', 60),
];

List<ChartData> weekData = [
  ChartData('Week 1', 20),
  ChartData('Week 2', 25),
  ChartData('Week 3', 30),
  ChartData('Week 4', 80),
];

List<ChartData> monthData = [
  ChartData('Jan', 80),
  ChartData('Feb', 70),
  ChartData('Mar', 90),
  ChartData('Apr', 85),
];

class ChartData {
  final String day;
  final double value;

  ChartData(this.day, this.value);
}
