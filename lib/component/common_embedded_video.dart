import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonEmbeddedVideo extends StatelessWidget {
  CommonEmbeddedVideo({
    Key? key,
    required this.videoUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  String videoUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(videoUrl);
    videoUrl = '${videoUrl.substring(matches.first.start, matches.first.end)}';
    return Container(
      height: height,
      width: width,
      // color: AppColors.grey50,
      child: Html(
        data:
            '<iframe width="$width" height="$height" src="${videoUrl}"></iframe>',
        navigationDelegateForIframe: (NavigationRequest request) {
          if (request.url.contains("google.com")) {
            return NavigationDecision.prevent;
          } else if (request.url.contains('www.youtube.com/watch')) {
            return NavigationDecision.prevent;
          } else if (request.url.contains('www.youtube.com/channel')) {
            return NavigationDecision.prevent;
          } else {
            return NavigationDecision.navigate;
          }
        },
      ),
    );
  }
}
