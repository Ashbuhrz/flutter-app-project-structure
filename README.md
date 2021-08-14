# flutter-app-project_structure

This repo provide the prebuild project struture for the flutter app
## Features

1) For state management  Getx package is used.
2) Localization is added, for updating language jsons acess [TranslationMessages.dart](https://github.com/tosif91/flutter-app-project-structure/blob/master/lib/util/theme/translation_message.dart)file , In [main.dart](https://github.com/tosif91/flutter-app-project-structure/blob/master/lib/main.dart) update locale param of GetMaterialApp.
3) For registering singletons access [locator.dart](https://github.com/tosif91/flutter-app-project-structure/blob/master/lib/locator.dart) //uses get_it package for singletons.
4) Checkout [extension](https://github.com/tosif91/flutter-app-project-structure/tree/master/lib/util/extension)folder for added extension for different objects.
5) Checkout [helper](https://github.com/tosif91/flutter-app-project-structure/tree/master/lib/util/helper.dart) classes provides different features ex: local_storage,haptic,file_picker etc.
6) Checkout [mixin](https://github.com/tosif91/flutter-app-project-structure/tree/master/lib/util/mixin) folder, contains other useful features.
7) [theme_constant.dart](https://github.com/tosif91/flutter-app-project-structure/blob/master/lib/util/theme/theme_constant.dart) contains different classes for color constants , size constants.
8) [constant.dart](https://github.com/tosif91/flutter-app-project-structure/blob/master/lib/util/constant.dart) contains basic constant DT required for app.
9) [image_const.dart](https://github.com/tosif91/flutter-app-project-structure/blob/master/lib/util/image_const.dart) this class provide paths for the assets->images & icons
10) Checkout [api](https://github.com/tosif91/flutter-app-project-structure/tree/master/lib/service/network/api) folder which provide service for api calls and error management
11) Checkout [socialLogin](https://github.com/tosif91/flutter-app-project-structure/tree/master/lib/service/network/socialLogin) folder contains prebuilt signing functionality for Twitter,Facebook,Goodle,Apple.
12) [connectivity.dart](https://github.com/tosif91/flutter-app-project-structure/blob/master/lib/service/network/connectivity.dart) file provide stream to mange network state //uses connectivity package to access network state
13) Checkout [sqlite](https://github.com/tosif91/flutter-app-project-structure/tree/master/lib/service/storage/sqlite) folder to mange local database and also contains database migration functionality.
14) Checkout [storage_service.dart](https://github.com/tosif91/flutter-app-project-structure/blob/master/lib/service/storage/storage_service.dart) the file uses get_storage package to store date in local storage 
15) Checkout [component](https://github.com/tosif91/flutter-app-project-structure/tree/master/lib/component) this folder provide common widget which are required in an app.
16) In [screen](https://github.com/tosif91/flutter-app-project-structure/tree/master/lib/screen) folder build your screen and controller using Getx.

