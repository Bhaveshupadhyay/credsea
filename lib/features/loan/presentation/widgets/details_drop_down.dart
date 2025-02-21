import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class DetailsDropDown extends StatelessWidget {
  final String title;
  final String hintText;
  final String? selectedValue;
  final List<String> options;
  final void Function(String?) onChanged;
  const DetailsDropDown({super.key, required this.title,required this.hintText, required this.selectedValue, required this.options, required this.onChanged});

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
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color: AppColor.greyColor.withValues(alpha: 0.5)
              )
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              hint: Text(hintText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 15.sp,
                    color: Colors.black54
                ),),
              items: options
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 15.sp,
                  color: Colors.black
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 15.w),
              icon: Icon(Icons.keyboard_arrow_down,size: 24.sp,),
              isExpanded: true,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
