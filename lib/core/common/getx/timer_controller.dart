import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController{
  var seconds=60.obs;

  Timer? timer;

  void startTimer(){
    seconds(60);
    // showSnackBar('Otp sent',AppColor.darkGreenColor);
    timer=Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value == 0) {
        timer.cancel();
      } else {
        seconds--;
      }
    });
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    if(timer!=null){
      timer!.cancel();
    }
    super.onClose();
  }
}