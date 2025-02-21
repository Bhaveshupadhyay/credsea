import 'package:cred_sea/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonTextField extends StatelessWidget {

  final String hintText;
  final Icon? icon;
  final TextEditingController textEditingController;
  final bool? isObscureText;
  final VoidCallback? onIconTap;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final Color? borderColor;
  final bool? isReadOnly;
  final List<TextInputFormatter>? inputFormatters;


  const CommonTextField({super.key, required this.hintText, this.icon,
    required this.textEditingController, this.isObscureText, this.onIconTap, required this.keyboardType, this.borderColor, this.isReadOnly, this.onTap, this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: borderColor?? AppColor.greyColor
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
                onTap: onTap,
                controller: textEditingController,
                readOnly: isReadOnly??false,
                obscureText: isObscureText ?? false,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 15.sp,
                        color: Colors.black54
                    ),
                ),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.blackColor,
                ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "$hintText is missing!";
                }
                return null;
              },
            ),
          ),

          if(icon!=null)
            InkWell(
              onTap: onIconTap,
              child: icon,
            ),
          SizedBox(width: 10.w,),
        ],
      ),
    );
  }
}
