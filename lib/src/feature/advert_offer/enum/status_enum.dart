import 'package:city17/src/constant/app_color.dart';
import 'package:flutter/material.dart';

enum StatusEnum {
  running,
  stop;

  String get title => switch (this) {
    running => 'Running',
    stop => 'Stop',
  };

  Color get color => switch (this) {
    running => AppColors.successTextcolor,
    stop => AppColors.errorTextcolor,
  };
}
