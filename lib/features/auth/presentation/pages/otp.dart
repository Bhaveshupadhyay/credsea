import 'package:cred_sea/core/common/widgets/color_full_btn.dart';
import 'package:cred_sea/features/auth/presentation/getx/auth_controller.dart';
import 'package:cred_sea/features/auth/presentation/getx/timer_controller.dart';
import 'package:cred_sea/features/auth/presentation/widgets/auth_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_color.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController= Get.find();
    final TimerController timerController= Get.put(TimerController());

    ever(authController.isPhoneVerified, (isPhoneVerified) {
      if (isPhoneVerified) {
        Navigator.pushNamed(context, '/password');
      }
    });

    return AuthContainer(
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h,),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,color: AppColor.greyColor,size: 24.sp,)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Enter OTP',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.black,
                          fontSize: 20.sp
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              RichText(
                text: TextSpan(
                    text: 'Verify OTP, Sent on ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp
                    ),
                    children: [
                      TextSpan(
                        text: '+91 ${authController.phoneController.text}',
                        style: Theme.of(context).textTheme.titleSmall?.
                        copyWith(
                            color: Colors.black,
                            fontSize: 14.sp
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10.h,),
              OtpTextField(
                numberOfFields: 6,
                focusedBorderColor: AppColor.blueColor,
                mainAxisAlignment: MainAxisAlignment.start,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp
                ),
                margin: EdgeInsets.only(right: 5.w),
                fieldHeight: 45.h,
                fieldWidth: 45.w,
                borderRadius: BorderRadius.circular(6.r),
                onSubmit: (String verificationCode){
                  authController.otp(verificationCode);
                }, // end onSubmit
              ),
              SizedBox(height: 20.h,),
              Obx(()=>
                  InkWell(
                    onTap: (){
                      timerController.startTimer();
                    },
                    child: Text(timerController.seconds.value!=0? '00:${timerController.seconds.value}' : 'Resend Otp',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
              ),
              SizedBox(height: 20.h,),
              SizedBox(
                width: double.infinity,
                child: ColorFullBtn(
                    text: 'Verify',
                    onTap: (){
                      authController.verifyPhoneNumber();
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
