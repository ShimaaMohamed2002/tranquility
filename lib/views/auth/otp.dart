import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/auth/change_password.dart';
import 'package:tranquility/views/home/view.dart';

import '../../core/design/app_image.dart';

class OTPView extends StatelessWidget {
  final bool isAfterRegister;

  const OTPView({Key? key, required this.isAfterRegister}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(24.r),
        children: [
          AppImage(
            "otp.png",
            height: 220.h,
            marginBottom: 16.h,
          ),
          Text(
            "Verification",
            style: TextStyle(fontSize: 24.sp),
          ),
          Text(
            "Please enter the code sent on your phone.",
            style: TextStyle(
              fontSize: 18.sp,
              color: Theme.of(context).primaryColor.withOpacity(.30),
            ),
          ),
          SizedBox(height: 24.h),
          PinCodeTextField(
            backgroundColor: Colors.white,
            appContext: context,
            length: 4,
            cursorColor: Theme.of(context).primaryColor,
            keyboardType: TextInputType.number,
            enableActiveFill: true,
            pinTheme: PinTheme(
                fieldHeight: 60.h,
                fieldWidth: 70.w,
                selectedColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).primaryColor.withOpacity(.3),
                activeFillColor: Theme.of(context).primaryColor.withOpacity(.1),
                inactiveFillColor: Theme.of(context).primaryColor.withOpacity(.1),
                selectedFillColor: Theme.of(context).primaryColor.withOpacity(.1),
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8.r)),
          ),
          SizedBox(height: 40.h),
          FilledButton(
            onPressed: () {
              if (isAfterRegister) {
                navigateTo(HomeView());
              } else {
                navigateTo(ChangePasswordView());
              }
            },
            child: Text("Verify"),
          )
        ],
      ),
    );
  }
}
