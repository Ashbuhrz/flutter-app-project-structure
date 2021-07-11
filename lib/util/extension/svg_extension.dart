part of 'extension.dart';

extension SVGIcons on String {
  Widget svgAssetImage(
          {double? width,
          double? height,
          Color? color,
          BoxFit fit = BoxFit.contain,
          AlignmentDirectional alignment = AlignmentDirectional.center,
          bool? matchTxtDir}) =>
      SvgPicture.asset(
        this,
        matchTextDirection: matchTxtDir ?? true,
        width: width,
        color: color,
        height: height,
        fit: fit,
        alignment: alignment,
      );
}
