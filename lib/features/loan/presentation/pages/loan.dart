import 'package:cred_sea/core/theme/app_color.dart';
import 'package:cred_sea/features/loan/presentation/getx/loan_naviagtion_controller.dart';
import 'package:cred_sea/features/loan/presentation/pages/approval.dart';
import 'package:cred_sea/features/loan/presentation/pages/loan_navigation.dart';
import 'package:cred_sea/features/loan/presentation/pages/offer.dart';
import 'package:cred_sea/features/loan/presentation/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getx/apply_loan_controller.dart';

class Loan extends StatelessWidget {
  const Loan({super.key});

  static const List<String> _screens=['Register','Offer','Approval'];

  @override
  Widget build(BuildContext context) {
    final LoanNavigationController loanController = Get.put(LoanNavigationController());
    final ApplyLoanController applyLoanController = Get.put(ApplyLoanController());

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Obx(()=>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List<Widget>.generate(3,(index){
                    return Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index==loanController.currentIndex.value? AppColor.blueColor: Colors.grey.shade300
                          ),
                          child: Text('${index+1}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: index==loanController.currentIndex.value? AppColor.whiteColor: AppColor.blackColor,
                                fontSize: 13.sp
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Text(_screens[index],
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: index==loanController.currentIndex.value? AppColor.blueColor: AppColor.greyColor,
                              fontSize: 13.sp
                          ),
                        ),
                      ],
                    );
                  }),
                ),
            ),
            SizedBox(height: 20.h,),

            Obx((){
              return Expanded(
                child: IndexedStack(
                  index: loanController.currentIndex.value,
                  children: [
                    RoundedContainer(
                      child: LoanNavigation(),
                    ),
                    Offer(),
                    RoundedContainer(
                      child: Approval(),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

}
