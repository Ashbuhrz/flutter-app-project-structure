// part of 'extension.dart';

// extension ExtBuildContext on BuildContext {
//   ThemeData get theme => Theme.of(this);
//   double get height => MediaQuery.of(this).size.height;
//   double get width => MediaQuery.of(this).size.width;
//   double get fontScaleFactor => MediaQuery.of(this).devicePixelRatio;

//   /// performs a simple [Navigator.pop] action and returns given [result]
//   void navigateBack() => Navigator.pop(this);

//   /// performs a simple [Navigator.push] action with given [route]
//   void navigateTo(Widget screen) {
//     Navigator.of(this).push(MaterialPageRoute<Widget>(builder: (_) => screen));
//   }

//   void present(Widget screen) {
//     Navigator.of(this).push(CupertinoPageRoute<Widget>(
//         fullscreenDialog: true, builder: (_) => screen));
//   }

//   /// performs a simple [Navigator.pushReplacement] action with given [route]
//   void replaceWith(Widget screen) {
//     Navigator.of(this).pushReplacement(MaterialPageRoute<Widget>(builder: (_) {
//       return screen;
//     }));
//   }

//   void showError(String? message) {
//     HapticFeedback.heavyImpact();
//     MessageBar.error(message: message).show(this);
//   }

//   void showSucess(String message) {
//     HapticFeedback.heavyImpact();
//     MessageBar.success(message: message).show(this);
//   }

//   void showInfo(String message) {
//     HapticFeedback.heavyImpact();
//     MessageBar.information(message: message).show(this);
//   }
// }
