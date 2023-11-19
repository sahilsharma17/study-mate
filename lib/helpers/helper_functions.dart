import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devTools;

class HelperFunctions {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userId = "USERID";
  //Saving Data
  static Future<bool> saveLoggedInUserId(String? uid) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    if (uid != null) {
      return sf.setString(userId, uid);
    } else {
      return false;
    }
  }

  //Get Data
  static Future<bool> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    bool result = sf.getBool(userId) ?? false;
    devTools.log(result.toString());
    return result;
  }

  static Future<String?> getLoggedInUserId() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userId);
  }
}
