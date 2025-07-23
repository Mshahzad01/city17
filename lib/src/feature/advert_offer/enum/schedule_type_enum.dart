enum ScheduleTypeEnum {
  daily,
  weekly,
  monthly;

  String get title => switch (this) {
    daily => 'Daily',
    weekly => 'Weekly',
    monthly => 'Monthly',
  };
}
