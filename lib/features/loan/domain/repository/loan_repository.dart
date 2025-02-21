import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

abstract interface class LoanRepository{

  Future<Either<Failure, bool>> updateUserDetails({
    required String firstName,
    required String lastName, required String dob, required String gender,
    required String maritalStatus
  });
  Future<Either<Failure, bool>> sendOtpToEmail(String email);
  Future<Either<Failure, bool>> verifyEmail(String email,String otp);
  Future<Either<Failure, bool>> updatePan(String pan);
}