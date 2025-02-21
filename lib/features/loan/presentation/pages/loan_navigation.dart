import 'package:cred_sea/features/loan/presentation/pages/apply_loan.dart';
import 'package:cred_sea/features/loan/presentation/pages/approval.dart';
import 'package:cred_sea/features/loan/presentation/pages/personal_details.dart';
import 'package:cred_sea/features/loan/presentation/pages/personal_email.dart';
import 'package:cred_sea/features/loan/presentation/pages/verify_pan.dart';
import 'package:flutter/material.dart';

class LoanNavigation extends StatelessWidget {
  const LoanNavigation({super.key,});

  @override
  Widget build(BuildContext context) {

    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/details':
            return sendToPage(PersonalDetails());
          case '/email':
            return sendToPage(PersonalEmail());
          case '/pan':
            return sendToPage(VerifyPan());
          case '/applyLoan':
            return sendToPage(ApplyLoan());
          case '/approval':
            return sendToPage(Approval());
        }
        return sendToPage(PersonalDetails());
      },
    );
  }

  PageRouteBuilder sendToPage(Widget page){
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: Duration(seconds: 0),
      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    );
  }
}
