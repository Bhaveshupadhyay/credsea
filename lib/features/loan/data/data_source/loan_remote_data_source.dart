import 'dart:convert';

import 'package:cred_sea/core/constant/url.dart';
import 'package:cred_sea/core/utils/user_auth.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';

abstract  class LoanRemoteDataSource{
  Future<bool> updateUserPersonalDetails({required String firstName, required String lastName,
    required String dob,required String gender,required String maritalStatus,});
  Future<bool> sendOtpToEmail(String email);
  Future<bool> verifyEmail(String email,String otp);
  Future<bool> updatePan(String pan);
}

class LoanRemoteDataSourceImpl implements LoanRemoteDataSource{

  final Dio dio;

  LoanRemoteDataSourceImpl(this.dio);

  @override
  Future<bool> sendOtpToEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePan(String pan) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserPersonalDetails({required String firstName,
    required String lastName, required String dob, required String gender,
    required String maritalStatus}) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "first_name": firstName,
      "last_name": lastName,
      "dob": dob,
      "gender": gender,
      "marital_status": maritalStatus,
      "id": UserAuth.uid
    });
    try{
      var response = await dio.request(
        '$apiBaseUrl/user/user_update',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        return response.data['isSuccess'];
      }
      else if(response.statusCode == 400 || response.statusCode == 500){
        throw Failure(response.data['message']);
      }
      else {
        throw Failure(response.statusMessage);
      }
    }
    on DioException catch(e){
      if(e.type ==DioExceptionType.badResponse) {
        throw Failure(e.response?.data['message']??e.message);
      }
      throw Failure(e.message);
    }
  }

  @override
  Future<bool> verifyEmail(String email, String otp) {
    throw UnimplementedError();
  }

}