import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String mymsg, [Color? customBackgroundColor]) {
  customBackgroundColor ??= AppColorsDark.primaryColor; // default value

  Fluttertoast.showToast(
    msg: mymsg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: customBackgroundColor,
    textColor: AppColorsDark.save,
    fontSize: 16.0,
  );
}
