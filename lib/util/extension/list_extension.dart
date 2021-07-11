part of 'extension.dart';

extension listExtension on List {
  String arraytostring() {
    return this.toString().replaceAll("[", "").replaceAll("]", "");
  }
}
