import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/features/loan/data/data_source/loan_remote_data_source.dart';
import 'package:cred_sea/features/loan/domain/repository/loan_repository.dart';
import 'package:fpdart/src/either.dart';

class LoanRepositoryImpl implements LoanRepository{

  final LoanRemoteDataSource loanRemoteDataSource;

  LoanRepositoryImpl(this.loanRemoteDataSource);

  @override
  Future<Either<Failure, bool>> sendOtpToEmail(String email) {
    // TODO: implement sendOtpToEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updatePan(String pan) {
    // TODO: implement updatePan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateUserDetails({required String firstName, required String lastName,
    required String dob, required String gender, required String maritalStatus}) async {
    try{
      final res= await loanRemoteDataSource.updateUserPersonalDetails(firstName: firstName,
          lastName: lastName, dob: dob, gender: gender, maritalStatus: maritalStatus);
      return right(res);
    }
    on Failure catch (e){
      return left(e);
    }
    catch(e){
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyEmail(String email, String otp) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

}