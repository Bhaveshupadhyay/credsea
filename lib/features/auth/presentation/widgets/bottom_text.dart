import 'package:cred_sea/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BottomText({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColor.darkBlueColor,
            fontSize: 14.sp
        ),
      ),
    );
  }
}
