import 'package:city17/src/constant/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin ToastUtils {
  static Future<bool?> succesToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.successTextcolor,
      gravity: ToastGravity.TOP,
    );
  }

  static Future<bool?> errorToast(String error) {
    return Fluttertoast.showToast(
      msg: error,
      backgroundColor: AppColors.warningTextcolor,
      gravity: ToastGravity.TOP,
    );
  }
}
