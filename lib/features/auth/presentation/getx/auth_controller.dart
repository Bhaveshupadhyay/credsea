import 'package:cred_sea/core/theme/app_color.dart';
import 'package:cred_sea/core/utils/show_snackbar.dart';
import 'package:cred_sea/features/auth/domain/usecases/current_user.dart';
import 'package:cred_sea/features/auth/domain/usecases/use_create_password.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_login.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_send_otp.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_verify_otp.dart';
import 'package:cred_sea/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/user_auth.dart';

class AuthController extends GetxController{
  final TextEditingController phoneController= TextEditingController();
  final passwordController= TextEditingController();
  final confirmPasswordController= TextEditingController();
  final TextEditingController loginPhoneController= TextEditingController();
  final loginPasswordController= TextEditingController();

  final formKey= GlobalKey<FormState>();
  var isChecked=false.obs;
  var isLoading=false.obs;
  var isPhoneVerified=false.obs;
  var isPasswordCreated=false.obs;
  var verificationCode=''.obs;
  var otp=''.obs;

  final UserSendOtp userSendOtp;
  final UserVerifyPhoneNumber userVerifyPhoneNumber;
  final UserCreatePassword userCreatePassword;
  final UserLogin userLogin;
  final CurrentUser currentUser;

  AuthController({required this.userSendOtp,
    required this.userVerifyPhoneNumber,
    required this.userCreatePassword,
    required this.userLogin,
    required this.currentUser,
  });


  @override
  void onInit() {
    isUserSignedUp();
    super.onInit();
  }

  Future<void> isUserSignedUp() async {
    // final res=await currentUser(NoParams());
    // print(FirebaseAuth.instance.currentUser);
    // res.fold((onLeft){
    //
    // }, (user){
    //   if(user!=null){
    //     Get.to(MyHomePage());
    //   }
    // });
  }

  bool _isPhoneNumValid(){
    if(phoneController.text.isEmpty || phoneController.text.length<10){
      showSnackBar('The phone number should have 10 digits');
      return false;
    }
    return true;
  }

  bool _isTermsAccepted(){
    if(!isChecked.value){
      showSnackBar('Kindly accept the terms and conditions.');
      return false;
    }
    return true;
  }

  bool canSendOtp(){
    if(!_isPhoneNumValid() || !_isTermsAccepted()) return false;
    return true;
  }

  Future<void> sendOtp(BuildContext context) async {
    isLoading(true);
    final res= await userSendOtp('+91${phoneController.text}');
    isLoading(false);

    res.fold(
            (failure){
              showSnackBar('Unable to verify Otp. Reason : ${failure.message}');
            },
            (verificationId){
              showSnackBar('Otp sent',AppColor.darkGreenColor);
              verificationCode(verificationId);
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pushNamed(
                context,
                '/otp',
              );
            }
    );
  }

  Future<void> verifyPhoneNumber() async {
    isLoading(true);
    final res= await userVerifyPhoneNumber(UserPhoneParams(otp: otp.value, verificationCode: verificationCode.value));
    isLoading(false);

    res.fold(
            (failure){
              showSnackBar('Unable to verify Otp. Reason : ${failure.message}');
            },
            (onRight){
              isPhoneVerified(true);
            }
    );
  }

  void changeCheckState(){
    isChecked.value=!isChecked.value;
  }

  bool _validatePassword(){
    if(passwordController.text.isEmpty){
      showSnackBar('Password cannot be empty');
      return false;
    }
    if(confirmPasswordController.text.isEmpty){
      showSnackBar('Confirm Password cannot be empty');
      return false;
    }
    if(passwordController.text!=confirmPasswordController.text){
      showSnackBar("Password doesn't match");
      return false;
    }
    return true;
  }

  Future<void> createPassword() async {
    if(_validatePassword()){
      isLoading(true);
      final res= await userCreatePassword(LoginParams(phone: phoneController.text, password: passwordController.text));
      isLoading(false);
      res.fold(
              (failure){
            showSnackBar('Unable to Create Password. Reason : ${failure.message}');
          },
              (onRight){
            isPasswordCreated(true);
          }
      );
    }
  }

  Future<void> loginWithPassword(BuildContext context) async {
    isLoading(true);
    final res= await userLogin(LoginParams(phone: loginPhoneController.text, password: loginPasswordController.text));
    isLoading(false);
    res.fold(
            (failure){
          showSnackBar('Unable to Login. Reason : ${failure.message}');
        },
            (onRight) async {
              await UserAuth.isUserLoggedIn();
          Get.offAll(MyHomePage());
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   '/main', (Route<dynamic> route) => false,
          // );
        }
    );
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    loginPhoneController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }
}