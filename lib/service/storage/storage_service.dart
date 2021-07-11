import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _singleton = StorageService._internal();
  factory StorageService() => _singleton;
  StorageService._internal();

  final GetStorage _getStorage = GetStorage();

  Future<bool> writeField({required String key, dynamic value}) async {
    return await _getStorage
        .writeIfNull(key, value)
        .then((value) => true)
        .catchError((onError) => false);
  }

  deleteAllField() async {
    await _getStorage.erase();
  }

  T readField<T>({required String key}) {
    return _getStorage.read(key);
  }

  Future<bool> deleteField({required String key}) async {
    return await _getStorage
        .remove(key)
        .then((value) => true)
        .catchError((onError) => false);
  }
}
