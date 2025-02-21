import 'package:cred_sea/features/loan/presentation/pages/loan.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth{
  static bool _isLoggedIn=false;
  static String _uid='';

  static Future<void> isUserLoggedIn() async {
    final prefs= await SharedPreferences.getInstance();
    _isLoggedIn= prefs.getBool('isLoggedIn')??false;
    _uid= prefs.getString('uid')??'';
  }

  static Future<void> saveUser(String uid) async {
    final prefs= await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    prefs.setString('uid', uid);
  }

  static bool get isLoggedIn =>_isLoggedIn;
  static String get uid =>_uid;
}