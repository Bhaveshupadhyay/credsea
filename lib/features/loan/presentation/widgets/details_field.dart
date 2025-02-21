import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/common_textfield.dart';
import '../../../../core/theme/app_color.dart';

class DetailsField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Icon? icon;
  final VoidCallback? onIconTap;
  final VoidCallback? onTap;
  final bool? isReadOnly;

  const DetailsField({super.key, required this.controller, required this.title, required this.hintText, this.icon, this.onIconTap, this.isReadOnly, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColor.blackColor,
              fontSize: 15.sp
          ),
        ),
        CommonTextField(
          hintText: hintText,
          textEditingController: controller,
          borderColor: AppColor.greyColor.withValues(alpha: 0.5),
          keyboardType: TextInputType.text,
          onTap: onTap,
          onIconTap: onIconTap,
          icon: icon,
          isReadOnly: isReadOnly,
        ),
      ],
    );
  }
}
