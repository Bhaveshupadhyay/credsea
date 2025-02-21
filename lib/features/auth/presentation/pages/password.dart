import 'package:cred_sea/core/common/widgets/common_textfield.dart';
import 'package:cred_sea/features/auth/presentation/getx/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/common/widgets/color_full_btn.dart';
import '../widgets/auth_container.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  bool _isPasswordVisible=false;
  bool _isConfirmPasswordVisible=false;

  @override
  Widget build(BuildContext context) {

    final AuthController authController= Get.find();

    ever((authController.isPasswordCreated), (isPasswordCreated)=>
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/login', (Route<dynamic> route) => false,
          // arguments: DetailsArguments('Sample Data'),
        )
    );
    return AuthContainer(
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h,),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,color: AppColor.greyColor,size: 24.sp,)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Create a password',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.black,
                          fontSize: 20.sp
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Text('Enter password',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5.h,),
              CommonTextField(
                hintText: 'Enter password',
                textEditingController: authController.passwordController,
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
              Text('Re enter password',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5.h,),
              CommonTextField(
                hintText: 'Re enter password',
                textEditingController: authController.confirmPasswordController,
                keyboardType: TextInputType.text,
                isObscureText: !_isConfirmPasswordVisible,
                icon: Icon(_isConfirmPasswordVisible? Icons.visibility : Icons.visibility_off,
                  size: 24.sp,
                  color: Colors.black,
                ),
                onIconTap: (){
                  setState(() {
                    _isConfirmPasswordVisible=!_isConfirmPasswordVisible;
                  });
                },
              ),

              SizedBox(height: 5.h,),
              Text('*your password must include at least 8 characters, inclusive of alt least 1 special character',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.sp,
                  color: AppColor.greyColor
                ),
              ),

              SizedBox(height: 10.h,),

              Obx(
                    ()=> authController.isLoading.value?
                    Loader():
                    SizedBox(
                      width: double.infinity,
                      child: ColorFullBtn(
                          text: 'Proceed',
                          onTap: (){
                            FocusScope.of(context).requestFocus(FocusNode());
                            authController.createPassword();
                          }
                      ),
                    )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
