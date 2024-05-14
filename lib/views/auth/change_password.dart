import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/design/app_image.dart';
import 'package:tranquility/core/design/app_input.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/home/view.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

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
            "Change Your Password",
            style: TextStyle(fontSize: 24.sp),
          ),
          SizedBox(height: 16.h),
          AppInput(
            labelText: "Old Password",
            isPassword: true,
          ),
          AppInput(
            labelText: "New Password",
            isPassword: true,
          ),
          AppInput(
            labelText: "Confirm New Password",
            isPassword: true,
            marginBottom: 24.h,
          ),
          FilledButton(
            onPressed: () {
              navigateTo(HomeView(),keepHistory: false);
            },
            child: Text("Change Password"),
          )
        ],
      ),
    );
  }
}
