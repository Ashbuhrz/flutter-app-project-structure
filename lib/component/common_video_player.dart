import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_structure/util/constant.dart';
import 'package:project_structure/util/theme/theme_constant.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class CommonVideoPlayer extends StatefulWidget {
  CommonVideoPlayer(
      {Key? key,
      required this.videoURL,
      this.width,
      this.height,
      this.showControls = true})
      : super(key: key);
  String videoURL;
  bool showControls;
  double? width;
  double? height;
  @override
  _CommonVideoPlayerState createState() => _CommonVideoPlayerState();
}

class _CommonVideoPlayerState extends State<CommonVideoPlayer> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoURL)
      ..initialize().then((_) {
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      placeholder: Container(
        color: AppColors.black.withOpacity(0.8),
      ),
      autoPlay: false,
      looping: false,
      // aspectRatio: 16 / 9,

      allowPlaybackSpeedChanging: false,
      allowFullScreen: true,
      // aspectRatio: widget.width! / widget.height!,
      showOptions: false,
      showControls: widget.showControls,
    );
    _controller.addListener(() {
      if (_chewieController.isFullScreen)
        FocusScope.of(context).requestFocus(new FocusNode());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? Get.width,
      height: widget.height ?? Get.width * 0.42,
      child: Stack(
        children: <Widget>[
          if (_controller.value.isInitialized)
            Chewie(
              controller: _chewieController,
            )
          else
            Container(
              color: AppColors.black.withOpacity(0.8),
              alignment: Alignment.center,
              child:
                  Lottie.asset(LottieConstants.loader, height: 35, width: 35),
              width: widget.width ?? double.infinity,
              height: widget.height ?? context.width * 0.42,
            ),
          // if (!_chewieController.isPlaying)
          //   Container(
          //     color: AppColors.black.withOpacity(0.7),
          //     width: widget.width ?? double.infinity,
          //     height: widget.height ?? context.width * 0.42,
          //     alignment: Alignment.center,
          //     child: InkWell(
          //       onTap: () {
          //         setState(() {
          //           _chewieController.play();
          //         });
          //       },
          //       child: ImageConst.Play.getPath()!.svgAssetImage(),
          //     ),
          //   )
        ],
      ),
    );
  }
}
