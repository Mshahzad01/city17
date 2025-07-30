enum LayoutEnum {
  horizantal,
  vartical;

  String get title => switch (this) {
    horizantal => 'Horizantal',
    vartical => 'vertical',
  };
}
