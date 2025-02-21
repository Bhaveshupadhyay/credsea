import 'package:cred_sea/core/theme/app_color.dart';
import 'package:cred_sea/features/auth/presentation/widgets/top_slider.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'auth_bottom_navigation.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          TopSlider(),
          Expanded(
            child: AuthBottomNavigation(funSendToMainScreen: _sendToMainPage,),
          ),
        ],
      ),
    );
  }

  void _sendToMainPage(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>MyHomePage()));
  }
}
