enum ImageEnums { appicon }

extension ImageEnumsExtension on ImageEnums {
  String get toPath => "assets/images/$name.png";
}
