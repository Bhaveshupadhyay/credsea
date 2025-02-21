import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class RoundedContainer extends StatelessWidget {
  final Widget? child;
  const RoundedContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withValues(alpha: 0.1),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 20,
          ),
        ],
      ),
      child: child,
    );
  }
}
