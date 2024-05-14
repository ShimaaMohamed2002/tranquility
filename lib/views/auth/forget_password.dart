import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/auth/otp.dart';

import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

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
            "Forget Your Password",
            style: TextStyle(fontSize: 24.sp),
          ),
          SizedBox(height: 16.h),
          AppInput(
            labelText: "Phone Number",
            keyboardType: TextInputType.phone,
            marginBottom: 24.h,
          ),
          FilledButton(
            onPressed: () {
              navigateTo(OTPView(isAfterRegister: false,));
            },
            child: Text("Forget Password"),
          )
        ],
      ),
    );
  }
}
