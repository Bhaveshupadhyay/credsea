import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:cred_sea/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cred_sea/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cred_sea/features/auth/domain/usecases/current_user.dart';
import 'package:cred_sea/features/auth/domain/usecases/use_create_password.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_login.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_send_otp.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_verify_otp.dart';
import 'package:cred_sea/features/auth/presentation/getx/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/common/widgets/color_full_btn.dart';
import '../widgets/auth_container.dart';
import '../../../../core/common/widgets/common_textfield.dart';
import '../widgets/bottom_text.dart';
import '../widgets/terms_richText.dart';

class Phone extends StatelessWidget {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {

    final authController= Get.put(AuthController(
        userSendOtp: UserSendOtp(AuthRepositoryImpl(AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio()))),
        userVerifyPhoneNumber: UserVerifyPhoneNumber(AuthRepositoryImpl(
            AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio()))
        ), userCreatePassword: UserCreatePassword(AuthRepositoryImpl(AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio()))),
        userLogin: UserLogin(AuthRepositoryImpl(AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio()))),
        currentUser: CurrentUser(AuthRepositoryImpl(AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio())))
    ));

    return Form(
      key: authController.formKey,
      child: AuthContainer(
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h,),
                Center(
                  child: Text('Welcome to Credit Sea!',
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
                                fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CommonTextField(
                        hintText: 'Please enter your mobile no.',
                        textEditingController: authController.phoneController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 5.w,
                  children: [
                    Obx(()=>
                        Transform.scale(
                          scale: 1.4,
                          child: Checkbox(
                            value: authController.isChecked.value,
                            activeColor: AppColor.darkGreenColor,
                            checkColor: AppColor.whiteColor,
                            onChanged: (value){
                              authController.changeCheckState();
                            },
                          ),
                        ),
                    ),
                    Flexible(child: TermsRichText()),
                  ],
                ),
                SizedBox(height: 20.h,),
                Obx(()=>
                    SizedBox(
                      width: double.infinity,
                      child: authController.isLoading.value?
                      Loader():
                      ColorFullBtn(
                          text: 'Request OTP',
                          onTap: () async {
                            if(authController.formKey.currentState!.validate() && authController.canSendOtp()){
                              await authController.sendOtp(context);
                            }
                          }
                      ),
                    ),
                ),

                SizedBox(height: 20.h,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomText(
                      text: 'Existing User? Sign in',
                      onTap: (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login', (Route<dynamic> route) => false,
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
