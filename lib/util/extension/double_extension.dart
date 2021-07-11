part of 'extension.dart';

extension WidgetExtension on double {
  Widget get widthSizedBox => SizedBox(width: this);
  Widget get heightSizedBox => SizedBox(height: this);
}
