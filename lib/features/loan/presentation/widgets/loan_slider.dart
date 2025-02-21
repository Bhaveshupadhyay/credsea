import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class LoanSlider extends StatelessWidget {
  final String title;
  final double sliderValue;
  final double maxSliderValue;
  final String? prefixText;
  final String? suffixText;
  final TextEditingController textEditingController;
  final void Function(double) onChanged;

  const LoanSlider({super.key, required this.title, required this.sliderValue,
    required this.onChanged, this.prefixText, this.suffixText, required this.textEditingController, required this.maxSliderValue, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColor.blackColor,
                  fontSize: 14.sp
              ),
            ),

            Container(
              width: 115.w,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.blackColor.withValues(alpha: 0.1),
                  ),
                  borderRadius: BorderRadius.circular(10.r)
              ),
              child: TextFormField(
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: prefixText,
                    suffixText: suffixText,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w)
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.blackColor,
                  ),
                onChanged: (amount){
                    if(amount.isNotEmpty){
                      double sliderValue=double.parse(amount.replaceAll(',', ''))/(maxSliderValue*10);
                      onChanged(sliderValue<maxSliderValue? sliderValue : maxSliderValue);
                    }
                },
              ),
            ),
          ],
        ),
        Slider(
          min: 0.0,
          max: maxSliderValue,
          value: sliderValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
