import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devTools;

class HelperFunctions {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userId = "USERID";
  static String userEmailKey = "USEREMAILKEY";
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
  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  // getting the data from SF


  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}
