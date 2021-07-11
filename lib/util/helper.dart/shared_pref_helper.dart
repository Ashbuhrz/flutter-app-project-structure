 
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPref {
//   //Keys
//   static const String isSignedIn = 'isSignedIn';
//   final String appUDID = 'appUDID';
//   final String deviceToken = 'deviceToken';
//   static const String token = 'token';
//   static const String loginEmail = 'loginEmail';
//   static const String loginPassword = 'loginPassword';
//   static String currUser = 'currUser';
//   static String firebaseToken = 'firebaseToken';
//   static String currLocale = 'currLocale';
//   static String selectedCountry = 'selectedCountry';
//   static String selectedCountryFlag = 'selectedCountryFlag';

//   final IV iv = IV.fromLength(8);
//   final Encrypter encrypter = Encrypter(Salsa20(Key.fromLength(32)));

//   // For plain-text data
//   Future<void> set(String key, dynamic value) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     if (value is bool) {
//       sharedPreferences.setBool(key, value);
//     } else if (value is String) {
//       sharedPreferences.setString(key, value);
//     } else if (value is double) {
//       sharedPreferences.setDouble(key, value);
//     } else if (value is int) {
//       sharedPreferences.setInt(key, value);
//     }
//   }

//   //Method for get from any key
//   Future<dynamic> get(String key, {dynamic defaultValue}) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     return sharedPreferences.get(key) ?? defaultValue;
//   }

//   //Example for get string
//   Future<String> getString(String key) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     return sharedPreferences.get(key) as String? ?? '';
//   }

//   //Example for get bool
//   Future<bool> isLoggedIn() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     return sharedPreferences.get(isSignedIn) as bool? ?? false;
//   }

//   Future<void> setEncrypted(String key, String value) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     sharedPreferences.setString(key, encrypter.encrypt(value).base64);
//   }

//   Future<String?> getEncrypted(String key) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     Encrypted? encrypted = sharedPreferences.get(key) as Encrypted?;
//     if (encrypted == null) return null;
//     return encrypter.decrypt(encrypted, iv: iv);
//   }

//   Future<UserInfoModel?> getCurrUser() async {
//     final SharedPreferences sharedPreferences =
//     await SharedPreferences.getInstance();
//     final String profileData = sharedPreferences.get(currUser) as String? ?? '';
//     if (profileData == '') {
//       return null;
//     }
//     return userInfoModelFromJson(profileData);
//   }

//   Future<void> setUuid(String uuid) {
//     return setEncrypted(appUDID, uuid);
//   }

//   Future<String?> getUuid() {
//     return getEncrypted(appUDID);
//   }

//   Future<void> setToken(String uuid) async {
//     return setEncrypted(appUDID, uuid);
//   }

//   Future<String?> getToken() async {
//     return getEncrypted(appUDID);
//   }

//   // For logging out
//   Future<void> deleteAll() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(isSignedIn);
//     await prefs.remove(appUDID);
//     await prefs.remove(deviceToken);
//     await prefs.remove(loginEmail);
//     await prefs.remove(loginPassword);
//   }
// }
