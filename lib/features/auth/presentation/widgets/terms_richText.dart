import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../webview/show_webview.dart';


class TermsRichText extends StatelessWidget {
  const TermsRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'By continuing, you agree to our',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade800,
            fontSize: 12.sp
          ),
          children: [
            TextSpan(
                text: ' privacy policy',
                style: Theme.of(context).textTheme.titleSmall?.
                copyWith(
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap= (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const ShowWebView(link: 'https://www.creditsea.com/privacy-policy')));
                  }
            ),
            TextSpan(
              text: ' and',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
                text: ' Terms & Conditions.',
                style: Theme.of(context).textTheme.titleSmall?.
                copyWith(
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap= (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const ShowWebView(link: 'https://www.creditsea.com/terms-and-conditions')));
                  }
            ),
          ]
      ),
    );
  }
}
