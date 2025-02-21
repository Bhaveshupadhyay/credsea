import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetailsController extends GetxController{

  final firstNameController= TextEditingController();
  final lastNameController= TextEditingController();
  final dobController= TextEditingController();
  final formKey = GlobalKey<FormState>();

  void uploadDetails(){

  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    super.onClose();
  }
}