import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_structure/util/theme/theme_constant.dart';

mixin ImageHandlerMixin {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage(ImageSource source) async {
    late final PickedFile? pickedFile;
    try {
      pickedFile = await _picker.getImage(
        source: source,
      );

      if (pickedFile != null) return _cropImage(File(pickedFile.path));
      return null;
    } catch (e) {
      Get.back();
      print(e);
      Get.snackbar('Error', 'Something Went Wrong!');
      return null;
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    return await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Profile Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Crop Profile',
        ));
  }

  showImagePickerBottomSheet(
      {required VoidCallback cameraSource,
      required VoidCallback gallerySource}) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20.0),
        // height: Get.height / 6,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!.withOpacity(0.5),
                offset: Offset(0, -1.6),
                spreadRadius: 3,
                blurRadius: 6,
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        // alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Image',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15.0),
            InkWell(
              onTap: cameraSource,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Camera',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10.0),
                  //show divider here
                ],
              ),
            ),
            InkWell(
              onTap: gallerySource,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Gallery',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10.0),
                  //show divider here
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Close',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.red),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // elevation: 10.0,
      // isDismissible: false,
      // barrierColor: Colors.transparent
      // enableDrag: false,
    );
  }
}
