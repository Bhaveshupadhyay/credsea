import 'package:cred_sea/core/error/failure.dart';
import 'package:cred_sea/core/usecase/usecase.dart';
import 'package:cred_sea/features/loan/domain/repository/loan_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateUserPersonalDetails implements UseCase<bool,UserPersonalDetailsParams>{
  final LoanRepository loanRepository;

  UpdateUserPersonalDetails(this.loanRepository);

  @override
  Future<Either<Failure, bool>> call(UserPersonalDetailsParams params) async {
    return await loanRepository.updateUserDetails(
        firstName: params.firstName,
        lastName: params.lastName,
        dob: params.dob,
        gender: params.gender,
        maritalStatus:params.maritalStatus
    );
  }

}

class UserPersonalDetailsParams{
  final String firstName;
  final String lastName;
  final String dob;
  final String gender;
  final String maritalStatus;

  UserPersonalDetailsParams({
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.maritalStatus,
  });
}