import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/loan/presentation/widgets/rectangular_slider_thumb_shape.dart';
import 'app_color.dart';

class AppTheme {
  static _border([Color color = AppColor.borderColor]) => OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  );
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.whiteColor,
    ),
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(
        AppColor.whiteColor,
      ),
      side: BorderSide.none,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      bodySmall: GoogleFonts.montserrat(
        color: Colors.black
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(15.r),
      border: InputBorder.none
      // border: _border(),
      // enabledBorder: _border(),
      // focusedBorder: _border(AppColor.blueColor),
      // errorBorder: _border(AppColor.errorColor),
    ),
    sliderTheme: SliderThemeData(
      thumbColor: AppColor.blueColor,
      // inactiveTrackColor: Color(0xFF8D8E98),
      activeTrackColor: AppColor.blueColor,
      trackHeight: 16.h,
      // overlayColor: Color(0x99EB1555),
      trackShape: RectangularSliderTrackShape(),
      thumbShape: RectangularSliderThumbShape(width: 6.w,height: 35.h),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
    )
  );

  static final lightGradient=LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Colors.grey[400]!,
      Colors.grey[200]!,
      Colors.grey[300]!,
      Colors.grey[200]!,
      Colors.grey[200]!
    ],
    stops: const <double>[
      0.0,
      0.35,
      0.5,
      0.65,
      1.0
    ],
  );
  static const profileColors = [
    Colors.amber,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple
  ];
}