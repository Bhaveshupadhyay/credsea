import 'package:cred_sea/features/loan/presentation/widgets/details_field.dart';
import 'package:cred_sea/features/loan/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/color_full_btn.dart';

class VerifyPan extends StatefulWidget {

  const VerifyPan({super.key});

  @override
  State<VerifyPan> createState() => _VerifyPanState();
}

class _VerifyPanState extends State<VerifyPan> {

  final _panController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        Header(title: 'Verify PAN Number'),
        Image.asset('assets/images/email.png',
          height: 170.h,
          width: 170.w,
        ),
        DetailsField(
            controller: _panController,
            title: 'Enter Your PAN Number*',
            hintText: 'e.g., ABCDE1234F'
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: ColorFullBtn(
                  text: 'Verify',
                  onTap: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.pushNamed(
                      context,
                      '/applyLoan',
                    );
                  }
              ),
            ),
          ),
        ),
        SizedBox(height: 30.h,)
      ],
    );
  }
  @override
  void dispose() {
    _panController.dispose();
    super.dispose();
  }
}
