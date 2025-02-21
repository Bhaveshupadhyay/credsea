import 'dart:async';
import 'dart:convert';

import 'package:cred_sea/core/constant/url.dart';
import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/core/utils/user_auth.dart';
import 'package:cred_sea/features/auth/data/models/user_model.dart';
import 'package:cred_sea/core/common/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';

abstract  class AuthRemoteDataSource{
  Future<String> sendOtp(String phone);
  Future<bool> verifyPhoneNumber(String otp,String verificationCode);
  Future<bool> createPassword(String phone,String password);
  Future<UserEntity?> loginWithPassword(String phone, String password);
  UserModel? currentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  final FirebaseAuth firebaseAuth;
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.firebaseAuth,required this.dio});

  @override
  Future<bool> createPassword(String phone,String password) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = jsonEncode({
      "password": password,
      "cpassword": password,
      "phno": phone
    });
    try{
      var response = await dio.request(
        '$apiBaseUrl/auth/register',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data['isSuccess'];
      }
      else {
        throw Failure(response.statusMessage);
      }
    }
    catch(e){
      throw Failure(e.toString());
    }
  }

  @override
  UserModel? currentUser() {
    try{
      User? user= firebaseAuth.currentUser;
      if(user!= null){
        return UserModel(id: user.uid, phone: user.phoneNumber??'');
      }
    }
    catch(e){
      throw Failure(e.toString());
    }
    return null;
  }

  @override
  Future<UserEntity?> loginWithPassword(String phone, String password) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "phno": phone,
      "password": password
    });
    try{
      var response = await dio.request(
        '$apiBaseUrl/auth/login',
        options: Options(
          method: 'POST',
          headers: headers
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        bool isSuccess= response.data['isSuccess'];
        if(isSuccess){
          UserAuth.saveUser(response.data['uid']);
          return UserModel(id: response.data['uid'], phone: phone);
        }
      }
      else {
        throw Failure(response.statusMessage);
      }
    }
    on DioException catch(e){
      // print(e.message);
      throw Failure(e.message);
    }
    return null;
  }

  @override
  Future<bool> verifyPhoneNumber(String otp,String verificationCode) async {
    bool isSuccess= false;
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode,
        smsCode: otp,

      );
      await firebaseAuth.signInWithCredential(credential);
      isSuccess=true;
    }
    catch (e){
      throw Failure(e.toString());
    }

    return isSuccess;
  }

  @override
  Future<String> sendOtp(String phone) async {
    final Completer<String> completer = Completer();

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
      },
      verificationFailed: (FirebaseAuthException e) {
        completer.completeError(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        completer.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
    return completer.future;
  }


}