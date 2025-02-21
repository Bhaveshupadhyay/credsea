import 'package:cred_sea/core/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/update_user_personal_details.dart';

class PersonalDetailsController extends GetxController{

  final firstNameController= TextEditingController();
  final lastNameController= TextEditingController();
  final dobController= TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading=false.obs;

  final UpdateUserPersonalDetails _updateUserPersonalDetails;

  PersonalDetailsController({
    required UpdateUserPersonalDetails updateUserPersonalDetails
  }): _updateUserPersonalDetails=updateUserPersonalDetails;

  Future<void> uploadDetails(String gender,String maritalStatus,BuildContext context) async {
    String firstName= firstNameController.text;
    String lastName= lastNameController.text;
    String dob= dobController.text;
    isLoading(true);
    final res= await _updateUserPersonalDetails(UserPersonalDetailsParams(firstName: firstName, lastName: lastName,
        dob: dob, gender: gender, maritalStatus: maritalStatus));
    isLoading(false);
    res.fold((failure){
      showSnackBar(failure.message??'Error');
    }, (isSuccess){
      if(isSuccess){
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.pushNamed(
          context,
          '/email',
        );
      }
    });

  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    super.onClose();
  }
}