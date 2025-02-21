import 'dart:ui';

import 'package:get/get.dart';
import '../theme/app_color.dart';

void showSnackBar(String message,[Color color=AppColor.errorColor]) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    backgroundColor: color,
    duration: Duration(seconds: 3),
  ));
}