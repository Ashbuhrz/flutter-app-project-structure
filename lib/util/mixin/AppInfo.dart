import 'package:package_info/package_info.dart';

mixin AppInfo {
  Future<String> getAppBuildNumber() async {
    return await PackageInfo.fromPlatform()
        .then((PackageInfo packageInfo) => packageInfo.buildNumber);
  }

  Future<String> getAppPackageVersion() async {
    return await PackageInfo.fromPlatform()
        .then((PackageInfo packageInfo) => packageInfo.version);
  }
}
