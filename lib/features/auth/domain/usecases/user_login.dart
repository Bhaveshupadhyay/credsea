import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/core/usecase/usecase.dart';
import 'package:cred_sea/features/auth/domain/repository/auth_repository.dart';
import 'package:cred_sea/features/auth/domain/usecases/use_create_password.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<bool, LoginParams>{
  final AuthRepository authRepository;

  UserLogin(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async {
    return await authRepository.loginWithPhone(phone: params.phone, password: params.password);
  }

}