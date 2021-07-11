String getImagePath(String imageName) {
  return "assets/images/$imageName";
}

String getIconPath(String imageName) {
  return "assets/icons/$imageName";
}

enum ImageConst { SvgIcon, Image }

extension imagePath on ImageConst {
  String getPath() {
    switch (this) {
      case ImageConst.SvgIcon:
        return getIconPath('svg_file_name.svg');
      case ImageConst.Image:
        return getImagePath('image_file_name.png');
    }
  }
}
