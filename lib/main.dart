import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_structure/locator.dart';
import 'package:project_structure/screen/splash/splash.dart';
import 'package:project_structure/util/theme/translation_message.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage
      .init(); // will use getstorage to store object or key/pair data locallly
  setUpLocator();
  // try {
  //   await Firebase.initializeApp();
  // } catch (e) {
  //   print(e.toString());
  // }
  runApp(
    KeyboardVisibilityBuilder(
      // this builder will sense keyboard state whenever keyboard hided it will remove focus from textfield
      builder: (context, isKeyBoardVisible) {
        if (!isKeyBoardVisible)
          FocusScope.of(context).requestFocus(new FocusNode());
        return ScreenUtilInit(
            //screen util is required to make the ui perfect according to device screen size
            designSize: Size(375, 812),
            builder: () => MyApp());
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      locale: Locale('en', 'US'), //for multiple language support
      fallbackLocale: Locale('en',
          'US'), //if failed to load any  data from  language json then it will consider it as default
      translations: TranslationMessages(),
      home: Splash(),
    );
  }
}
