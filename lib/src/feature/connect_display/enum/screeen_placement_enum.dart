enum ScreeenPlacementEnum {
  facingoutside,
  insideproverty;

  String get title => switch (this) {
    facingoutside => 'Facing out side',
    insideproverty => 'In side the Proverty',
  };
}
