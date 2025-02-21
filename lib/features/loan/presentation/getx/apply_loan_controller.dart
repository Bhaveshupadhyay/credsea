import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApplyLoanController extends GetxController{

  final amountController= TextEditingController(text: '0');
  final tenureController= TextEditingController(text: '0');
  final interestRate=1;

  var loanSliderValue=0.0.obs;
  var tenureSliderValue=0.0.obs;
  var principalAmount=0.obs;
  var tenure=0.obs;


  void updatePrincipalAmount(double value){
    principalAmount.value=(value*1000).toInt();
    amountController.text=NumberFormat('#,##,###').format(principalAmount.value);
    loanSliderValue.value=value;
  }

  void updateTenure(double value){
    tenureSliderValue.value=value;
    tenure.value=(value*100).toInt();
    tenureController.text='${tenure.toInt()}';
  }

  int getTotalPayableAmount(){
    num totalAmount = principalAmount.value * pow(1 + interestRate / 100, tenure.value);
    return totalAmount.toInt();
  }

  @override
  void onClose() {
    amountController.dispose();
    tenureController.dispose();
    super.onClose();
  }
}