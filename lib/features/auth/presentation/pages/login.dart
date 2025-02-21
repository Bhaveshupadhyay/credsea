import 'package:cred_sea/core/common/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/color_full_btn.dart';
import '../getx/auth_controller.dart';
import '../widgets/auth_container.dart';
import '../../../../core/common/widgets/common_textfield.dart';
import '../widgets/bottom_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isPasswordVisible=false;

  @override
  Widget build(BuildContext context) {
    final AuthController authController= Get.find();

    return AuthContainer(
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h,),
              Center(
                child: Text('Please enter your credentials',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                      fontSize: 20.sp
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Text('Mobile Number',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontSize: 14.sp
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                spacing: 10.w,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1
                        )
                    ),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Image.asset('assets/images/flag.png',
                          width: 30.w,
                          height: 20.h,
                        ),
                        Text('+91',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 14.sp
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: CommonTextField(hintText: 'Please enter your mobile no.',
                        textEditingController: authController.loginPhoneController,
                        keyboardType: TextInputType.phone
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Text('Enter password',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5.h,),
              CommonTextField(
                hintText: 'Enter password',
                textEditingController: authController.loginPasswordController,
                keyboardType: TextInputType.text,
                isObscureText: !_isPasswordVisible,
                icon: Icon(_isPasswordVisible? Icons.visibility : Icons.visibility_off,
                  size: 24.sp,
                  color: Colors.black,
                ),
                onIconTap: (){
                  setState(() {
                    _isPasswordVisible=!_isPasswordVisible;
                  });
                },
              ),
              SizedBox(height: 20.h,),
              Obx(
                    ()=> authController.isLoading.value?
                Loader():
                SizedBox(
                  width: double.infinity,
                  child: ColorFullBtn(
                      text: 'Sign In',
                      onTap: (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        authController.loginWithPassword(context);
                      }
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomText(
                    text: 'New to CreditSea? Create an account',
                    onTap: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/phone', (Route<dynamic> route) => false,
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
