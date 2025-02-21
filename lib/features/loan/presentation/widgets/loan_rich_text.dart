import 'package:flutter/material.dart';

class LoanRichText extends StatelessWidget {
  final List<TextWithStyle> list;
  const LoanRichText({super.key, required this.list,});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: '${list[0].text} ',
          style: list[0].style,
          children: List.generate(list.length-1, (i){
            int index= i+1;
            return TextSpan(
              text: '${list[index].text} ',
              style: list[index].style,
            );
          })
      ),
    );
  }
}

class TextWithStyle{
  final String text;
  final TextStyle? style;

  TextWithStyle({required this.text,this.style});
}
