import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/core/usecase/usecase.dart';
import 'package:cred_sea/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSendOtp implements UseCase<String,String>{

  final AuthRepository authRepository;

  UserSendOtp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(String phone) async {
    return await authRepository.sendOtp(phone: phone);
  }

}
