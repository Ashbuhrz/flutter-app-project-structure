import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static Color get orange => Color(0xffE19E5E);
  static Color get red => Color(0xffE74A48);
  static Color get green => Color(0xff2AAF92);
  static Color get gray => Color(0xffEFEFEF);
  static Color get txtGray => Color(0xff9B9B9B);
  static Color get progressBkg => Color(0xffD4D4D4);
  static Color get unSelectedBottomItem => Color(0xff777777);
  static Color get selectedBottomItem => Color(0xffF0B064);
  static Color get appBarTitle => Color(0xff373737);
  static Color get darkBlack => Color(0xff222222);
  static Color get grey30 => const Color(0xFFF5F5F5);
  static Color get white => const Color(0xFFFFFFFF);

  static Color get black => const Color(0xFF000000);
  static Color get grey50 => const Color(0xFFECECEB);

  static Color get grey1c => const Color(0xFFD0D0CE);

  static Color get txtGrey421c => const Color(0xFFB2B4B2);

  static Color get txtGrey422c => const Color(0xFF9EA2A2);

  static Color get txtGrey9c => const Color(0xFF75787B);

  static Color get txtGrey11c => const Color(0xFF53565A);
}

class SpaceConstant {
  static double k1 = 1;
  static double k2 = 2;
  static double k3 = 3;
  static double k4 = 4;
  static double k5 = 5;
  static double k6 = 6;
  static double k8 = 8;
  static double k10 = 10;
  static double k12 = 12;
  static double k14 = 14;
  static double k15 = 15;
  static double k16 = 16;
  static double k18 = 18;
  static double k20 = 20;
  static double k24 = 24;
  static double k25 = 25;
  static double k26 = 26;
  static double k30 = 30;
  static double k34 = 34;
  static double k40 = 40;
  static double k45 = 45;
  static double k50 = 50;
  static double k54 = 54;
  static double k74 = 74;
  static double k90 = 90;
}

// class TxtStyles {
//   static TextStyle get txtPriceQty12400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 12.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtPriceOfr12700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 12.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtPriceMid14700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 14.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 0.7,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtPriceLrg18700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 18.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtCaption12700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 12.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey9c);
//   static TextStyle get txtProductBrndLrg20700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 20.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtProductBrndSml16400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       height: 1.17,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtProductDesc12300 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 12.sp,
//       fontStyle: FontStyle.italic,
//       fontWeight: FontWeight.w300,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtSpace1312300 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 12.sp,
//       fontStyle: FontStyle.normal,
//       letterSpacing: 3.59,
//       height: 0.85,
//       fontWeight: FontWeight.w300,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtProductReg14400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 14.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeaderMain16700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 0.48,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeaderSub16400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtTitleSpc1116700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 1.76,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtTitleSpc1816700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 2.88,
//       height: 0.85,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtTitleSpc516700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 0.8,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtTitleLight16300 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w300,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtTitleLight22300 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 22.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w300,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtTitleBigLight36300 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 36.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w300,
//       letterSpacing: 0.18,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtTitleBig36700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 36.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaSmall13400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 13.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaSmall10700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 10.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaNormal14400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 14.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       height: 1.71,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaBoldItalic14700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 14.sp,
//       fontStyle: FontStyle.italic,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaBold16700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaBig16400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       height: 1.60,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaLargeItalic28300 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 28.sp,
//       fontStyle: FontStyle.italic,
//       fontWeight: FontWeight.w300,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaUl14700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 14.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       decoration: TextDecoration.underline,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtParaStrThr14700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 14.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 0.7,
//       decoration: TextDecoration.lineThrough,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtBtnSmall14700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 14.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtBtnReg14700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 14.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 0.7,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtBtnLarge18700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 18.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 0.9,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeadingH612700 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 12.8.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w700,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeadingH516400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeadingH420400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 16.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeadingH325400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 25.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeadingH231400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 31.25.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeadingH139400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 39.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);
//   static TextStyle get txtHeadingH3Spac5525400 => TextStyle(
//       fontFamily: 'Roboto Condensed',
//       fontSize: 25.sp,
//       letterSpacing: 13.875,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       color: AppColors.txtGrey11c);

//   static TextStyle get txtSign26400 => TextStyle(
//       fontFamily: 'Michigan Signature',
//       fontSize: 26.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 0.78,
//       color: AppColors.txtGrey9c);
//   static TextStyle get txtSign35400 => TextStyle(
//       fontFamily: 'Michigan Signature',
//       fontSize: 35.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 1.05,
//       color: AppColors.txtGrey9c);
//   static TextStyle get txtSign37400 => TextStyle(
//       fontFamily: 'Michigan Signature',
//       fontSize: 37.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 1.109,
//       color: AppColors.txtGrey9c);
//   static TextStyle get txtSign43400 => TextStyle(
//       fontFamily: 'Michigan Signature',
//       fontSize: 43.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 1.29,
//       color: AppColors.txtGrey9c);
//   static TextStyle get txtSign144400 => TextStyle(
//       fontFamily: 'Michigan Signature',
//       fontSize: 144.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 1.29,
//       color: AppColors.txtGrey9c);
//   static TextStyle get txtSign110400 => TextStyle(
//       fontFamily: 'Michigan Signature',
//       fontSize: 110.sp,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 1.29,
//       color: AppColors.txtGrey9c);
// }
