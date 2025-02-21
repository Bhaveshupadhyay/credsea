import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entities/user.dart';

class UserSignUp implements UseCase<User,UserSignUpParams>{

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) {
    throw UnimplementedError();
  }
}

class UserSignUpParams {
  final String phone;
  final String password;
  UserSignUpParams({
    required this.phone,
    required this.password,
  });
}