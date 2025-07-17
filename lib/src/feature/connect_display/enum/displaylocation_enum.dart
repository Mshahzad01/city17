enum DisplayLocationType {
  mobile,
  fixed;

  String get title => switch (this) {
    mobile => 'Mobile',
    fixed => 'Fixed',
  };
}
