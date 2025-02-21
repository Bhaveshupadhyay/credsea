import 'package:cred_sea/features/loan/presentation/getx/apply_loan_controller.dart';
import 'package:cred_sea/features/loan/presentation/getx/loan_naviagtion_controller.dart';
import 'package:cred_sea/features/loan/presentation/widgets/loan_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/widgets/color_full_btn.dart';
import '../../../../core/theme/app_color.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? normalStyle= Theme.of(context).textTheme.bodySmall?.copyWith(
        fontSize: 15.sp,
        color: AppColor.blackColor
    );
    final TextStyle? boldStyle= Theme.of(context).textTheme.titleSmall?.copyWith(
        fontSize: 15.sp,
        color: AppColor.blackColor
    );

    final LoanNavigationController loanController= Get.find();
    final ApplyLoanController applyLoanController= Get.find();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        spacing: 25.h,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Our Offerings',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColor.blackColor,
                fontSize: 20.sp
            ),
          ),
          Image.asset('assets/images/coin.gif',
            height: 200.h,
            width: 200.w,
          ),
          LoanRichText(
            list: [
              TextWithStyle(
                text: 'Congratulations!',
                style: normalStyle?.copyWith(color: AppColor.darkGreenColor)
              ),
              TextWithStyle(
                text: 'We can offer you',
                style: normalStyle
              ),
              TextWithStyle(
                text: 'Rs. ${NumberFormat('#,##,###')
                    .format(applyLoanController.principalAmount.value)}',
                style: boldStyle
              ),
              TextWithStyle(
                text: 'Amount Within',
                style: normalStyle
              ),
              TextWithStyle(
                text: '30 minutes',
                style: boldStyle
              ),
              TextWithStyle(
                text: 'for ${applyLoanController.tenure.value} days, with a payable amount of',
                style: normalStyle
              ),
              TextWithStyle(
                  text: 'Rs. ${NumberFormat('#,##,###')
                      .format(applyLoanController.getTotalPayableAmount())}.',
                  style: boldStyle
              ),
              TextWithStyle(
                  text: 'Just with few more steps.',
                  style: normalStyle
              ),
              TextWithStyle(
                  text: '\n\nProceed further to',
                  style: boldStyle
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Column(
            spacing: 10.h,
            children: [
              SizedBox(
                width: double.infinity,
                child: ColorFullBtn(
                    text: 'Accept Offer',
                    onTap: (){
                      loanController.changeIndex(2);
                    }
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ColorFullBtn(
                  text: 'Extend Offer',
                  onTap: (){
                    loanController.changeIndex(0);
                  },
                  bgColor: AppColor.whiteColor,
                  textColor: AppColor.blackColor,
                  borderSide: BorderSide(
                    color: AppColor.blueColor,
                    width: 2,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
