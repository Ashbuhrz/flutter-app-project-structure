import 'package:project_structure/util/constant.dart';

mixin Validations {
  String? validatePassword(
    String? value,
  ) {
    if (value!.isEmpty) {
      return 'Please choose a password.';
    }
    final RegExp nameExp =
        RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$");
    if (!nameExp.hasMatch(value)) {
      return 'Invalid password. Enter minimun 8 Characters, One Uppercase, One Lowercase, One Number and one special case Character';
    }

    return null;
  }

  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a value.';
    return null;
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.parse(s) != null;
  }

  String? validateFName(
    String? value,
  ) {
    if (value!.isEmpty) {
      return MsgConstants.enterFirstName;
    } else {
      final RegExp nameExp = RegExp(r'^[a-z A-Z,.\-]+$');
      if (!nameExp.hasMatch(value)) {
        return 'Please enter only alphabetical characters.';
      } else {
        return null;
      }
    }
  }

  String? validateLName(
    String? value,
  ) {
    if (value!.isEmpty) {
      return MsgConstants.enterLasttName;
    } else {
      final RegExp nameExp = RegExp(r'^[a-z A-Z,.\-]+$');
      if (!nameExp.hasMatch(value)) {
        return 'Please enter only alphabetical characters.';
      } else {
        return null;
      }
    }
  }

  String? validateUserName(
    String? value,
  ) {
    if (value!.isEmpty) {
      return MsgConstants.enterUserName;
    } else {
      return null;
    }
  }
}
