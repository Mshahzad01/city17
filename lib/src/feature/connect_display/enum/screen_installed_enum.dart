enum ScreenInstallEnum {
  shop,
  resturent,
  vehicle,
  other;

  String get title => switch (this) {
    shop => 'Shop',
    vehicle => 'Vehicle',
    other => 'Other',
    resturent => 'Resturent',
  };
}
