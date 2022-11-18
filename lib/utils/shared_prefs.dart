import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? prefs;

//! INITIALIZE PREF
  static void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  //! CLEAR PREFS
  static void clearPrefs() async {
    await prefs?.clear();
  }

  //! SAVE doctor ID
  static void setUserID({required String id}) {
    prefs?.setString('uniqueId', id);
  }

  //! GET Doctor ID
  static String getUserID() {
    String id = prefs?.getString('uniqueId') ?? '';
    return id;
  }

  //! save scoreTotal
  static void setScoreTotal({required double id}) {
    prefs?.setDouble('scoreTotal', id);
  }

  //! GET scoreTotal
  static double getScoreTotal() {
    double id = prefs?.getDouble('scoreTotal') ?? 0.0;
    return id;
  }

  static  clearScoreTotal() {
   return prefs?.remove('scoreTotal');
  }
}
