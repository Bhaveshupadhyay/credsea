import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/core/usecase/usecase.dart';
import 'package:cred_sea/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserCreatePassword implements UseCase<bool, LoginParams>{
  final AuthRepository authRepository;

  UserCreatePassword(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async {
    return await authRepository.createPassword(phone: params.phone, password: params.password);
  }

}

class LoginParams{
  final String phone;
  final String password;

  LoginParams({required this.phone,required this.password,});

}