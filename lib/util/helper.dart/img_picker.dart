import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_structure/util/theme/theme_constant.dart';
import 'package:project_structure/util/extension/extension.dart';

enum ImagePickerType { gallary, camera }

class ImagePickerHelper extends StatelessWidget {
  const ImagePickerHelper({
    Key? key,
    this.onDone,
    this.isCropped,
    this.size,
    this.cropStyle = CropStyle.rectangle,
  }) : super(key: key);

  final Function(File?)? onDone;
  final bool? isCropped;
  final Size? size;
  final CropStyle cropStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey30,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SpaceConstant.k5.heightSizedBox,
            // Align(
            //   alignment: AlignmentDirectional.center,
            //   child: CustomDividerWidget(
            //       // height: SpaceConstant.k4,
            //       // paddingH: context.width * 0.451,
            //       // color: AppColors.grey50,
            //       ),
            // ),
            SpaceConstant.k34.heightSizedBox,
            Text(
              'Set Your Profile Pic',
              // style: TxtStyles.txtTitleLight16300.apply(
              //   color: AppColors.txtGrey421c,
              // ),
            ).paddingSymmetricex(horizontal: SpaceConstant.k20),
            ListTile(
              title: Row(
                children: <Widget>[
                  // ImageConst.Camera.getPath()!
                  //     .svgAssetImage()
                  //     .paddingOnly(right: SpaceConstant.k10),
                  Text(
                    'from Camera'.toUpperCase(),
                    // style: TxtStyles.txtPriceMid14700.apply(
                    //   color: AppColors.txtGrey9c,
                    // ),
                  ),
                ],
              ),
              onTap: () async {
                getCroppedImage(ImagePickerType.camera, size!.height,
                        size!.width, context, cropStyle)
                    .then((File? img) {
                  Get.back();
                  onDone!(img);
                });
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  // ImageConst.Images.getPath()!
                  //     .svgAssetImage()
                  //     .paddingOnly(right: SpaceConstant.k10),
                  Text(
                    'From Picture Gallery'.toUpperCase(),
                    // style: TxtStyles.txtPriceMid14700.apply(
                    //   color: AppColors.txtGrey9c,
                    // ),
                  ),
                ],
              ),
              onTap: () async {
                getCroppedImage(ImagePickerType.gallary, size!.height,
                        size!.width, context, cropStyle)
                    .then((File? img) {
                  Get.back();
                  onDone!(img);
                });
              },
            ),
            // ListTile(
            //   title: Text('Cancel'.tr(), style: const TextStyle(color: Colors.red)),
            //   onTap: () {
            //     context.navigateBack();
            //     onDone!(null);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Future<File?> getCroppedImage(ImagePickerType type, double height,
      double width, BuildContext context, CropStyle? cropStyle) async {
    final ImagePicker picker = ImagePicker();
    return picker
        .getImage(
            source: type == ImagePickerType.camera
                ? ImageSource.camera
                : ImageSource.gallery)
        .then((PickedFile? img) {
      return ImageCropper.cropImage(
          sourcePath: img!.path,
          maxHeight: height.toInt(),
          maxWidth: width.toInt(),
          cropStyle: cropStyle ?? CropStyle.rectangle,
          aspectRatio: CropAspectRatio(
              ratioX: height.toDouble(), ratioY: width.toDouble()),
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Get.theme.primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
    });
  }
}
