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

  //! SET USER ID
  static void setUserID({required String id}) {
    prefs?.setString('uniqueId', id);
  }

  //! GET USER ID
  static String getUserID() {
    String id = prefs?.getString('uniqueId') ?? '';
    return id;
  }
    //! SAVE USER FINISHED GAME
  static void setUserFinishedGame({required String id}) {
    prefs?.setString('gameFinished', id);
  }
  //! GET USER FINISHED GAME
  static String getUserFinishedGame() {
    String id = prefs?.getString('gameFinished') ?? '';
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
