import 'package:cred_sea/features/auth/presentation/pages/login.dart';
import 'package:cred_sea/features/auth/presentation/pages/otp.dart';
import 'package:cred_sea/features/auth/presentation/pages/password.dart';
import 'package:cred_sea/features/auth/presentation/pages/phone.dart';
import 'package:flutter/material.dart';

class AuthBottomNavigation extends StatelessWidget {
  final Function funSendToMainScreen;
  const AuthBottomNavigation({super.key, required this.funSendToMainScreen});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/otp':
            return MaterialPageRoute(
              builder: (context) => Otp(),
              settings: settings,
            );
          case '/password':
          // final args = settings.arguments as DetailsArguments;
            return MaterialPageRoute(
              builder: (context) => Password(),
              settings: settings,
            );
            case '/login':
          // final args = settings.arguments as DetailsArguments;
            return MaterialPageRoute(
              builder: (context) => Login(),
              settings: settings,
            );
          case '/main':
          // final args = settings.arguments as DetailsArguments;
          funSendToMainScreen(context);
        }
        return MaterialPageRoute(
          builder: (context) => Phone(),
          settings: settings,
        );
      },
    );
  }
}
