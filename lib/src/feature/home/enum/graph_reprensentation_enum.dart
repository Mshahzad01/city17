enum GraphReprensentationEnum {
  textual,
  graphical;

  String get title => switch (this) {
    textual => 'Textual',
    graphical => 'Graphical',
  };
}
