import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  TextTheme get myTextTheme => Theme.of(this).textTheme;
}




