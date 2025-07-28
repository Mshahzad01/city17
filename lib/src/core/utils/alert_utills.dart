import 'dart:io';

import 'package:city17/src/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AlertUtils {
  static void alert(
    BuildContext context, {
    String title = 'Warning',
    String content = "Oops! Something doesn't seem to be right!",
    String actionBtnText = 'Ok',
    Function()? onPressed,
  }) {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          title: Text(title),
          content: Text(content),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            TextButton(
              onPressed: onPressed ?? () => Navigator.of(context).pop(true),
              child: Text(actionBtnText, style: const TextStyle(fontSize: 14)),
            ),
          ],
        ),
      );
    }
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            CupertinoDialogAction(
              onPressed: onPressed ?? () => Navigator.pop(context),
              child: Text(
                actionBtnText,
                style: const TextStyle(color: AppColors.primaryTextcolor),
              ),
            ),
          ],
        ),
      );
    }
  }

  static void snackBar(
    BuildContext context, {
    required String content,
    SnackBarAction? action,
  }) {
    final scaffold = ScaffoldMessenger.of(context);
    final snackBar = SnackBar(
      content: Text(
        content,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      action: SnackBarAction(
        backgroundColor: Colors.grey.shade800,
        label: 'Close',
        onPressed: () {
          scaffold.hideCurrentSnackBar();
        },
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
    scaffold.hideCurrentSnackBar();
    scaffold.showSnackBar(snackBar);
  }
}
