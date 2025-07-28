import 'package:flutter/foundation.dart';

mixin LogUtils {
  static void printLog(List logs) {
    for (int i = 0; i < logs.length; i++) {
      if (kDebugMode) {
        print(logs[i]);
      }
    }
  }
}
