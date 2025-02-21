import 'package:cred_sea/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorFullBtn extends StatelessWidget {

  final String text;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final BorderSide? borderSide;

  const ColorFullBtn({super.key, required this.text, required this.onTap,
    this.borderSide, this.bgColor=AppColor.blueColor,this.textColor=AppColor.whiteColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(bgColor),
      padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r),
              )
          ),
        side: WidgetStatePropertyAll(borderSide)
      ),
      child: Text(text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: textColor,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
