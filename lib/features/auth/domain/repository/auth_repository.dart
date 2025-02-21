import 'package:fpdart/fpdart.dart';
import '../../../../core/common/entities/user.dart';
import '../../../../core/error/failure.dart';

abstract interface class AuthRepository{
  Future<Either<Failure, String>> sendOtp({
    required String phone,
  });
  Future<Either<Failure, bool>> verifyPhoneNumber({
    required String otp,
    required String verificationCode,
  });
  Future<Either<Failure, bool>> createPassword({
    required String phone,
    required String password,
  });
  Future<Either<Failure, UserEntity?>> loginWithPhone({
    required String phone,
    required String password,
  });
  Either<Failure, UserEntity?> currentUser();
}
