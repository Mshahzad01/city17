enum BusinessCategoryEnum {
  returent,
  shop,
  vehicle,
  hotel;

  String get title => switch (this) {
    returent => 'Resturent',
    shop => 'Shop',
    vehicle => 'Vehicle',
    hotel => 'Hotel',
  };
}
