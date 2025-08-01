import 'package:flutter/material.dart';

enum DisplaysStatus {
  online,
  offline,
  draft;

  String get title => switch (this) {
    online => 'Online',
    offline => 'Ofline',
    draft => 'Drafts',
  };

  Color get color => switch (this) {
    online => Colors.green,
    offline => Colors.redAccent,
    draft => Colors.grey,
  };
}
