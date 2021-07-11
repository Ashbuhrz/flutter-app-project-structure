import 'package:get_it/get_it.dart';
import 'package:project_structure/service/network/api/api_service.dart';
import 'package:project_structure/service/network/socialLogin/social_login_service.dart';
import 'package:project_structure/service/storage/storage_service.dart';

GetIt locator = GetIt.instance;

setUpLocator() {
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => SocialLoginService());
  locator.registerLazySingleton(() => ApiService());
}
