import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/core/usecase/usecase.dart';
import 'package:cred_sea/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserVerifyPhoneNumber implements UseCase<bool,UserPhoneParams>{
  final AuthRepository authRepository;

  UserVerifyPhoneNumber(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(UserPhoneParams params) async {
    return await authRepository.verifyPhoneNumber(otp: params.otp, verificationCode: params.verificationCode);
  }
}

class UserPhoneParams{
  final String verificationCode;
  final String otp;

  UserPhoneParams({required this.verificationCode, required this.otp});
}