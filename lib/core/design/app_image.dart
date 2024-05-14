import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? height, width;
  final Color? color;
  final BoxFit? fit;
  final double? marginBottom;

  const AppImage(
    this.path, {
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.scaleDown,
    this.marginBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom ?? 0),
      child: Builder(
        builder: (context) {
          if (path.endsWith("svg")) {
            return SvgPicture.asset(
              "assets/svg/$path",
              height: height,
              width: width,
              color: color,
              fit: BoxFit.fill,
            );
          } else if (path.startsWith("http")) {
            return Image.network(
              path,
              height: height,
              width: width,
              color: color,
              errorBuilder: _error,
              fit: BoxFit.fill,
            );
          }
          return Image.asset(
            "assets/images/$path",
            height: height,
            width: width,
            color: color,
            errorBuilder: _error,
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }

  Widget _error(context, error, stackTrace) {
    return AppImage(
      "image_failed.svg",
      height: height,
      width: width,
      fit: fit,
    );
  }
}
