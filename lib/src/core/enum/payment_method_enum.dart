enum PaymentMethod {
  bank,
  cash,
  custom;

  String get title => switch (this) {
    bank => 'Bank',
    cash => 'Cash',
    custom => 'custom',
  };
}
