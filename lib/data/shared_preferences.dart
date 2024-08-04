import 'package:shared_preferences/shared_preferences.dart';

class SP {      
  static SharedPreferences? sp;
  static String recID = "recID";
  static String clinicID = "clinicID";
  static String login = "login";
  static String name = "name";
  static String age = "age";
  static String gender = "gender";
  static String phoneNumber = "phoneNumber";
  static Future init() async {
    sp = await SharedPreferences.getInstance();
  }
}