import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class LoanRoundedCornerContainer extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color? iconColor;
  final String assetPath;

  const LoanRoundedCornerContainer({super.key,
    required this.text,
    this.bgColor=AppColor.greyColor,
    this.iconColor,
    required this.assetPath
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: bgColor,
          width: 2
        )
      ),
      child: Stack(
        children: [
          Image.asset(
            assetPath,
            height: 20.h,
            width: 20.w,
            color: iconColor??bgColor,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 15.sp,
                  color: iconColor??bgColor,
                  fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }
}
