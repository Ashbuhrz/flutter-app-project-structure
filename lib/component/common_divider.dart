import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider(
      {Key? key, this.color, this.height, this.paddinV, this.paddingH})
      : super(key: key);
  final double? height;
  final Color? color;
  final double? paddingH;
  final double? paddinV;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: paddingH ?? 0, vertical: paddinV ?? 0),
      height: height,
      color: color,
    );
  }
}
