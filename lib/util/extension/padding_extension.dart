part of 'extension.dart';

///
/// Extension Method for the [Padding] Widget
///
extension PaddingX on Widget {
  Padding paddingAllex(double value, {Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding paddingOnlyex({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsetsDirectional.only(
            top: top, start: left, bottom: bottom, end: right),
        child: this,
      );

  Padding paddingLTRBex(
    double left,
    double top,
    double right,
    double bottom, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Padding paddingFromWindowPaddingex(
    ui.WindowPadding padding,
    double devicePixelRatio, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromWindowPadding(padding, devicePixelRatio),
        child: this,
      );

  Padding paddingSymmetricex(
          {double vertical = 0.0, double horizontal = 0.0, Key? key}) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );
}

extension ElevationX on Widget {
  Material elevation(double elevation) => Material(
        elevation: elevation,
        child: this,
      );
}
