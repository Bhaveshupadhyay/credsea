import 'package:cred_sea/core/common/widgets/color_full_btn.dart';
import 'package:cred_sea/features/loan/presentation/getx/drop_down_controller.dart';
import 'package:cred_sea/features/loan/presentation/widgets/details_drop_down.dart';
import 'package:cred_sea/features/loan/presentation/widgets/details_field.dart';
import 'package:cred_sea/features/loan/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../getx/personal_details_controller.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final PersonalDetailsController personalDetailsController = Get.put(PersonalDetailsController());
    final GenderDropDownController genderDropDownController = Get.put(GenderDropDownController());
    final MaritalDownController maritalDownController = Get.put(MaritalDownController());

    return Form(
      key: personalDetailsController.formKey,
      child: Column(
        spacing: 20.h,
        children: [
          Header(title: 'Personal Details'),

          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: DetailsField(
                  title: 'First Name*',
                  hintText: 'Your first name',
                  controller: personalDetailsController.firstNameController,
                ),
              ),
              Expanded(
                child: DetailsField(
                  title: 'Last Name*',
                  hintText: 'Your last name',
                  controller: personalDetailsController.lastNameController,
                ),
              ),
            ],
          ),

          Obx(()=>
              DetailsDropDown(
                  title: 'Gender*',
                  hintText: 'Select your gender',
                  selectedValue: genderDropDownController.selectedGender.value,
                  options: genderDropDownController.genders,
                  onChanged: (value){
                    genderDropDownController.changeGender(value);
                  }
              ),
          ),

          DetailsField(
            title: 'Date of Birth*',
            hintText: 'DD - MM - YYYY',
            controller: personalDetailsController.dobController,
            icon: Icon(Icons.date_range,size: 24.sp,),
            isReadOnly: true,
            onIconTap: (){
              _selectDate(context,personalDetailsController);
            },
            onTap: (){
              _selectDate(context,personalDetailsController);
            },
          ),

          Obx(()=>
              DetailsDropDown(
                  title: 'Your Marital Status *',
                  hintText: 'Select',
                  selectedValue: maritalDownController.selectedMarital.value,
                  options: maritalDownController.maritalStatus,
                  onChanged: (value){
                    maritalDownController.changeMarital(value);
                  }
              ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ColorFullBtn(
                    text: 'Continue',
                    onTap: (){
                      if(personalDetailsController.formKey.currentState!.validate()
                          && genderDropDownController.validate() && maritalDownController.validate()){
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.pushNamed(
                          context,
                          '/email',
                        );
                      }
                    }
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h,)
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, PersonalDetailsController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      controller.dobController.text = DateFormat('dd - MM - yyyy').format(picked);
    }
  }
}
