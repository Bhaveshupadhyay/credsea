import 'package:cred_sea/core/theme/app_color.dart';
import 'package:cred_sea/core/utils/show_snackbar.dart';
import 'package:get/get.dart';

class LoanPurposeDropDownController extends GetxController{

  final loanPurposeList= <String>['Business Expansion','Home Purchase','Debt Consolidation','Education'];

  final selectedPurpose=(null as String?).obs;

  void changeLoanPurpose(String? purpose){
    selectedPurpose.value=purpose;
  }

}

class GenderDropDownController extends GetxController{

  final genders=<String>['Male','Female'];
  final selectedGender=(null as String?).obs;

  void changeGender(String? gender){
    selectedGender.value=gender;
  }

  bool validate(){
    if(selectedGender.value==null){
      showSnackBar('Please select your gender');
      return false;
    }
    return true;
  }

}

class MaritalDownController extends GetxController{

  final selectedMarital=(null as String?).obs;
  final maritalStatus=<String>['Mr','Mrs','Bachelor'];

  void changeMarital(String? marital){
    selectedMarital.value=marital;
  }

  bool validate(){
    if(selectedMarital.value==null){
      showSnackBar('Please select your marital status');
      return false;
    }
    return true;
  }

}

