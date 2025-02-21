import 'package:cred_sea/core/common/entities/user.dart';
import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cred_sea/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> createPassword({required String phone, required String password}) async {
    try{
      bool isSuccess= await authRemoteDataSource.createPassword(phone, password);
      return right(isSuccess);
    }
    catch (e){
      return left(Failure(e.toString()));
    }
  }

  @override
  Either<Failure, User?> currentUser() {
    try{
      User? user= authRemoteDataSource.currentUser();
      return right(user);
    }
    catch (e){
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> loginWithPhone({required String phone, required String password}) async {
    try{
      bool isSuccess= await authRemoteDataSource.loginWithPassword(phone, password);
      return right(isSuccess);
    }
    catch (e){
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> sendOtp({required String phone}) async {
    try{
      String verificationId=await authRemoteDataSource.sendOtp(phone);
      return right(verificationId);
    }
    catch (e){
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyPhoneNumber({required String otp, required String verificationCode}) async {
    try{
      bool isSuccess=await authRemoteDataSource.verifyPhoneNumber(otp,verificationCode);
      return right(isSuccess);
    }
    catch (e){
      return left(Failure(e.toString()));
    }
  }



}