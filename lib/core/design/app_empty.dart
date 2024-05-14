import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/design/app_image.dart';

class AppEmpty extends StatelessWidget {
  final String title, image;

  const AppEmpty({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImage(
          image,
          height: 200.h,
          width: 200.h,
          color: Theme.of(context).primaryColor,
          marginBottom: 8.h,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp
          ),
        )
      ],
    );
  }
}
