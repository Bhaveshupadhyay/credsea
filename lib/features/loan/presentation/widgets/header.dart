import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  const Header({super.key, required this.title, this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onBackTap?? ()=> Navigator.pop(context),
            child: Icon(Icons.arrow_back,size: 24.sp,)
        ),
        SizedBox(width: 20.w,),
        Text(title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColor.blackColor,
              fontSize: 20.sp
          ),
        ),
      ],
    );
  }
}
