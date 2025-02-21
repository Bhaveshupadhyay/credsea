import 'package:carousel_slider/carousel_slider.dart';
import 'package:cred_sea/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopSlider extends StatefulWidget {
  const TopSlider({super.key});

  @override
  State<TopSlider> createState() => _TopSliderState();
}

class _TopSliderState extends State<TopSlider> {
  int _currentIndex = 0;

  final List<String> _images= ['car_bike.png','verified_frame.png','customer_frame.png'];
  final List<String> _titles= ['Flexible Loan Options','Instant Loan Approval','24x7 Customer Care'];
  final List<String> _description= ['Loan types to cater to different financial needs',
    'Users will receive approval within minutes',
    'Dedicated customer support team'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: _images.length,
                itemBuilder: (itemBuilder,index,i){
                  return SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo_horizontal.png',
                            width: 243.w,
                            height: 70.h,
                          ),
                          SizedBox(height: 10.h,),
                          SizedBox(
                            height: 184.h,
                            width: 184.w,
                            child: Image.asset('assets/images/${_images[index]}'),
                          ),
                          SizedBox(height: 10.h,),
                          Text(_titles[index],
                            style: Theme.of(context).textTheme.
                            titleSmall?.copyWith(
                              fontSize: 16.sp,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                            maxLines: 1,
                          ),
                          Text(_description[index],
                            style: Theme.of(context).textTheme.
                            bodySmall?.copyWith(
                              fontSize: 12.sp,
                              color: Colors.white.withValues(alpha: 0.7),
                              letterSpacing: 1,
                            ),
                            maxLines: 1,
                          )
                        ],
                      )
                  );
                },
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: 1.sw/350.h,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3,
                    (index) => Container(
                  width: index==_currentIndex? 20 : 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: _currentIndex == index
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }

}
