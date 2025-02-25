import 'package:cred_sea/core/common/widgets/color_full_btn.dart';
import 'package:cred_sea/features/loan/presentation/widgets/details_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/getx/timer_controller.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/header.dart';

class PersonalEmail extends StatefulWidget {
  const PersonalEmail({super.key});

  @override
  State<PersonalEmail> createState() => _PersonalEmailState();
}

class _PersonalEmailState extends State<PersonalEmail> {

  final _emailController= TextEditingController();
  final TimerController timerController= Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 20.h,
        children: [
          Header(title: 'Personal Email ID'),
          Image.asset('assets/images/email.png',
            height: 170.h,
            width: 170.w,
          ),
          DetailsField(
              controller: _emailController,
              title: 'Email ID*',
              hintText: 'Enter your email ID'
          ),
          Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('OTP Verification',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColor.blackColor,
                    fontSize: 15.sp
                ),
              ),
              OtpTextField(
                numberOfFields: 5,
                focusedBorderColor: AppColor.blueColor,
                mainAxisAlignment: MainAxisAlignment.start,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp
                ),
                margin: EdgeInsets.only(right: 15.w),
                fieldHeight: 50.h,
                fieldWidth: 50.h,
                borderRadius: BorderRadius.circular(6.r),
                onSubmit: (String verificationCode){
                }, // end onSubmit
              ),

              Obx(()=>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Didn't receive it?",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColor.blackColor,
                                  fontSize: 13.sp
                              ),
                              children: [
                                TextSpan(
                                  text: "Resend Code",
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColor.blueColor,
                                      fontSize: 13.sp
                                  ),
                                )
                              ]
                          )
                      ),
                      Text('00:${timerController.seconds.value}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColor.blackColor,
                            fontSize: 13.sp
                        ),
                      )
                    ],
                  ),
              ),

            ],
          ),
          SizedBox(height: 30.h,),
          SizedBox(
            width: double.infinity,
            child: ColorFullBtn(
                text: 'Verify',
                onTap: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.pushNamed(
                    context,
                    '/pan',
                    // arguments: DetailsArguments('Sample Data'),
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
