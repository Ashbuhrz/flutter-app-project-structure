part of 'extension.dart';

extension strExtension on String? {
  String get() {
    return this ?? "N/A";
  }

  bool get isNullOrEmpty {
    return this == null || (this != null && this?.isEmpty == true);
  }

  DateTime convertFromServer() {
    return isNullOrEmpty ? DateTime.now() : DateTime.parse(this!);
  }

  String convertDate({String? format = "dd.MM hh:mm"}) {
    DateFormat formatter = DateFormat(format);
    return formatter.format(convertFromServer());
  }

  T readFromKey<T>() => locator<StorageService>().readField<T>(key: this!);

  Future<bool> deleteKeyValue() async =>
      await locator<StorageService>().deleteField(key: this!);

  Future<bool> writeLocally({required String key}) async =>
      await locator<StorageService>().writeField(value: this!, key: key);

  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.parse(this!) != null;
  }

  bool validDouble() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null && double.tryParse(this!)! > 0;
  }

  Color colorFromHex() {
    if (this == null) return Color(0xffFFFFFF);
    final hexCode = this!.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  Widget loadNetworkImage(
          {double? height, double? width, BoxFit? fit, String? errorImg}) =>
      CachedNetworkImage(
          placeholder: (BuildContext c, String s) => Center(
              // child:
              // Lottie.asset(LottieConstants.loader, height: 40, width: 40),
              ),
          fit: fit ?? BoxFit.fill,
          height: height,
          width: width,
          errorWidget: (_, __, ___) => Container(),
          imageUrl: this!);

  Widget loadNetworkImageWithInitials(
          {double? height, double? width, BoxFit? fit, String? initials}) =>
      CachedNetworkImage(
          placeholder: (BuildContext c, String s) => Center(
              // child:
              //     Lottie.asset(LottieConstants.loader, height: 40, width: 40),
              ),
          fit: fit ?? BoxFit.fill,
          height: height,
          width: width,
          errorWidget: (_, __, ___) => Container(
                height: height,
                width: width,
                color: AppColors.grey1c,
                child: Center(
                  child: Text(
                    initials ?? 'N/A',
                    // style: TxtStyles.txtProductBrndLrg20700
                    //     .copyWith(color: AppColors.white),
                  ),
                ),
              ),
          imageUrl: this!);
}
