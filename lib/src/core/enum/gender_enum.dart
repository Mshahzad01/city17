enum Gender {
  male,
  female,
  notDefined;

  String get title => switch (this) {
    male => 'Male',
    female => 'Female',
    notDefined => 'Not Defined',
  };
}
