import 'package:get/get.dart';

class LoanNavigationController extends GetxController{
  var currentIndex= 0.obs;
  var isApplyLoan= false.obs;

  void changeIndex(int index){
    currentIndex.value=index;
  }
}