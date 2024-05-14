import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';
class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(24.r),
        children: [
          AppImage(
            "forget_password.png",
            height: 220.h,
            marginBottom: 16.h,
          ),
          Text(
            "Create New Password",
            style: TextStyle(fontSize: 24.sp),
          ),
          Text(
            "create your new password to log in !",
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 16.h),
          AppInput(
            labelText: "Password",
            isPassword: true,
          ),
          AppInput(
            labelText: "Confirm New Password",
            isPassword: true,
            marginBottom: 24.h,
          ),
          FilledButton(
            onPressed: () {},
            child: Text("Confirm"),
          )
        ],
      ),
    );
  }
}
