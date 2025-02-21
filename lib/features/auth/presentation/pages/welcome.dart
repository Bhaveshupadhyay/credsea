import 'package:cred_sea/core/theme/app_color.dart';
import 'package:cred_sea/features/auth/presentation/widgets/top_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:cred_sea/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cred_sea/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cred_sea/features/auth/domain/usecases/current_user.dart';
import 'package:cred_sea/features/auth/domain/usecases/use_create_password.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_login.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_send_otp.dart';
import 'package:cred_sea/features/auth/domain/usecases/user_verify_otp.dart';
import 'package:cred_sea/features/auth/presentation/getx/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import 'auth_bottom_navigation.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController(
        userSendOtp: UserSendOtp(AuthRepositoryImpl(AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio()))),
        userVerifyPhoneNumber: UserVerifyPhoneNumber(AuthRepositoryImpl(
            AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio()))
        ), userCreatePassword: UserCreatePassword(AuthRepositoryImpl(AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio()))),
        userLogin: UserLogin(AuthRepositoryImpl(AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio()))),
        currentUser: CurrentUser(AuthRepositoryImpl(AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance, dio: Dio())))
    ));

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          TopSlider(),
          Expanded(
            child: AuthBottomNavigation(funSendToMainScreen: _sendToMainPage,),
          ),
        ],
      ),
    );
  }

  void _sendToMainPage(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>MyHomePage()));
  }
}
