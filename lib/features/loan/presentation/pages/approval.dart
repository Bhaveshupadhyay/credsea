import 'package:cred_sea/core/common/widgets/color_full_btn.dart';
import 'package:cred_sea/features/loan/presentation/widgets/header.dart';
import 'package:cred_sea/features/loan/presentation/widgets/loan_rich_text.dart';
import 'package:cred_sea/features/loan/presentation/widgets/loan_rounded_corner_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_color.dart';
import '../getx/loan_naviagtion_controller.dart';

class Approval extends StatelessWidget {
  const Approval({super.key});

  @override
  Widget build(BuildContext context) {
    final LoanNavigationController loanController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          title: 'Application Status',
          onBackTap: (){
            loanController.changeIndex(1);
          },),
        LoanRichText(
          list: [
            TextWithStyle(
              text: 'Loan application no',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppColor.blackColor
              )
            ),
            TextWithStyle(
              text: '#CS12323',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppColor.blackColor
              )
            ),
          ],
        ),

        SizedBox(height: 20.h,),

        LoanRoundedCornerContainer(
            text: 'Application Submitted',
            bgColor: AppColor.darkGreenColor,
            assetPath: 'assets/images/notes_check.png',
        ),
        _verticalDivider(AppColor.darkGreenColor),
        LoanRoundedCornerContainer(
          text: 'Application under Review',
          assetPath: 'assets/images/notes.png',
          bgColor: AppColor.blueColor,
        ),
        _verticalDivider(AppColor.greyColor),
        LoanRoundedCornerContainer(
          text: 'E-KYC',
          assetPath: 'assets/images/notes.png',
          iconColor: AppColor.blackColor.withValues(alpha: 0.6),
        ),
        _verticalDivider(AppColor.greyColor),
        LoanRoundedCornerContainer(
          text: 'E-Nach',
          assetPath: 'assets/images/notes.png',
          iconColor: AppColor.blackColor.withValues(alpha: 0.6),
        ),
        _verticalDivider(AppColor.greyColor),
        LoanRoundedCornerContainer(
          text: 'E-Sign',
          assetPath: 'assets/images/notes.png',
          iconColor: AppColor.blackColor.withValues(alpha: 0.6),
        ),
        _verticalDivider(AppColor.greyColor),
        LoanRoundedCornerContainer(
          text: 'Disbursement',
          assetPath: 'assets/images/notes.png',
          iconColor: AppColor.blackColor.withValues(alpha: 0.6),
        ),

        SizedBox(height: 20.h,),
        Align(
          alignment: Alignment.center,
          child: Column(
            spacing: 5.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/notes_eye.png',
                height: 48.h,
                width: 48.w,
                color: AppColor.blueColor,
              ),
              Text(
                'Application Under Review',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'We’re carefully reviewing your application to ensure everything is in order. Thank you for your patience.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25.h,),
        SizedBox(
          width: double.infinity,
          child: ColorFullBtn(
              text: 'Continue',
              onTap: (){

              }
          ),
        )
      ],
    );
  }

  Widget _verticalDivider(Color color){
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
          height: 15.h,
          child: VerticalDivider(
              color: color
          )
      ),
    );
  }
}
