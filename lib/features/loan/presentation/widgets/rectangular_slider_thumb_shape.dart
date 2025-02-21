import 'package:flutter/material.dart';

class RectangularSliderThumbShape extends SliderComponentShape {
  final double width;
  final double height;

  RectangularSliderThumbShape({this.width = 20.0, this.height = 10.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(width, height);
  }

 @override
  void paint(PaintingContext context, Offset center,
     {required Animation<double> activationAnimation,
       required Animation<double> enableAnimation,
       required bool isDiscrete, required TextPainter labelPainter,
       required RenderBox parentBox, required SliderThemeData sliderTheme,
       required TextDirection textDirection, required double value,
       required double textScaleFactor, required Size sizeWithOverflow}) {

   final Canvas canvas = context.canvas;
   final Paint paint = Paint()
     ..color = Colors.blue // Set your desired color
     ..style = PaintingStyle.fill;

   final Rect rect = Rect.fromCenter(
     center: center,
     width: width,
     height: height,
   );

   canvas.drawRect(rect, paint);
  }
}

