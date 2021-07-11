import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_structure/util/theme/theme_constant.dart';

class DescriptionTextWidget extends StatefulWidget {
  DescriptionTextWidget(
      {@required this.text,
      @required this.textStyle,
      this.maxText = 25,
      this.onReadMore,
      this.align = TextAlign.start});
  final String? text;
  final TextStyle? textStyle;
  final TextAlign align;
  final int maxText;
  Function(bool)? onReadMore;
  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text!.length > widget.maxText) {
      firstHalf = widget.text!.substring(0, widget.maxText);
      secondHalf = widget.text!.substring(widget.maxText, widget.text!.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  GestureRecognizerFactory? factory;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf!.isEmpty
          ? Text(
              firstHalf!,
              style: widget.textStyle,
              textAlign: widget.align,
            )
          : Column(
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: flag ? ('$firstHalf...') : (firstHalf! + secondHalf!),
                    style: widget.textStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: flag ? ' Read more' : ' Show less',
                        style:
                            widget.textStyle!.apply(color: AppColors.txtGrey9c),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              flag = !flag;
                            });
                            if (widget.onReadMore != null)
                              widget.onReadMore!(!flag);
                          },
                      ),
                    ],
                  ),
                  textAlign: widget.align,
                ),
              ],
            ),
    );
  }
}
