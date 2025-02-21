import 'package:cred_sea/core/common/widgets/color_full_btn.dart';
import 'package:cred_sea/features/loan/presentation/getx/apply_loan_controller.dart';
import 'package:cred_sea/features/loan/presentation/getx/loan_naviagtion_controller.dart';
import 'package:cred_sea/features/loan/presentation/widgets/gradient_text.dart';
import 'package:cred_sea/features/loan/presentation/widgets/header.dart';
import 'package:cred_sea/features/loan/presentation/widgets/loan_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_color.dart';
import '../getx/drop_down_controller.dart';
import '../widgets/details_drop_down.dart';

class ApplyLoan extends StatelessWidget {
  const ApplyLoan({super.key});

  @override
  Widget build(BuildContext context) {
    final LoanNavigationController loanController = Get.find();
    final LoanPurposeDropDownController dropDownController = Get.put(LoanPurposeDropDownController());
    final ApplyLoanController applyLoanController = Get.find();
    final List<String> bottomAmountNames=['Principle Amount','Interest','Total Payable'];

    return SingleChildScrollView(
      child: Column(
        children: [
          Header(title: 'Apply for a loan',),
          Text('We’ve calculated your loan eligibility. Select your preferred loan amount and tenure.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.blackColor,
                fontSize: 14.sp
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            spacing: 12.w,
            children: List<Widget>.generate(2,(index){
              return DottedBorder(
                color: AppColor.blueColor,
                strokeWidth: 2,
                dashPattern: [6, 3],
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  color: Colors.transparent, // Container background color
                  child: Center(
                    child: Text( index==0?
                      'Interest Per Day 1%' : 'Processing Fee  10%',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColor.blackColor,
                          fontSize: 14.sp
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 20.h,),
          Obx(()=>
              DetailsDropDown(
                  title: 'Purpose of Loan*',
                  hintText: 'Select purpose of loan',
                  selectedValue: dropDownController.selectedPurpose.value,
                  options: dropDownController.loanPurposeList,
                  onChanged: (value){
                    dropDownController.changeLoanPurpose(value);
                  }
              ),
          ),
          SizedBox(height: 20.h,),
          Obx(()=>
              LoanSlider(
                  title: 'Principal Amount',
                  sliderValue: applyLoanController.loanSliderValue.value,
                  maxSliderValue: 100,
                  prefixText: '₹  ',
                  textEditingController: applyLoanController.amountController,
                  onChanged: (value){
                    applyLoanController.updatePrincipalAmount(value);
                  }
              ),
          ),
          SizedBox(height: 20.h,),
          Obx(()=>
              LoanSlider(
                  title: 'Tenure',
                  sliderValue: applyLoanController.tenureSliderValue.value,
                  maxSliderValue: 10,
                  suffixText: ' Days  ',
                  textEditingController: applyLoanController.tenureController,
                  onChanged: (value){
                    applyLoanController.updateTenure(value);
                  }
              ),
          ),

          SizedBox(height: 20.h,),
          Obx(()=>
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.blueColor,
                          AppColor.gradientGreenColor,
                          AppColor.blueColor,
                        ],
                      ),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6.r)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    spacing: 10.h,
                    children: List.generate(bottomAmountNames.length, (index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(bottomAmountNames[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp
                            ),
                          ),
                          Text(_getText(index,applyLoanController),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: AppColor.blueColor,
                                fontSize: 15.sp
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
          ),

          SizedBox(height: 20.h,),

          GradientText('Thank you for choosing CreditSea. Please accept to proceed with the loan details.',
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              gradient: LinearGradient(
                colors: [AppColor.gradientBlueColor,AppColor.gradientGreenColor]
              )
          ),
          SizedBox(height: 20.h,),
          SizedBox(
            width: double.infinity,
            child: ColorFullBtn(
                text: 'Apply',
                onTap: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  loanController.changeIndex(1);
                }
            ),
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            width: double.infinity,
            child: ColorFullBtn(
              text: 'Cancel',
              onTap: (){

              },
              bgColor: AppColor.whiteColor,
              textColor: AppColor.blackColor,
              borderSide: BorderSide(
                color: AppColor.blueColor,
                width: 2,
              ),
            ),
          ),
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }

  String _getText(int index,ApplyLoanController controller){
    if(index==0) {
      return '₹${NumberFormat('#,##,###').format(controller.principalAmount.value)}';
    }
    else if(index==1){
      return '1%';
    }
    return '₹${NumberFormat('#,##,###').format(controller.getTotalPayableAmount())}';
  }
}
