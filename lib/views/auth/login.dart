import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/auth/forget_password.dart';
import 'package:tranquility/views/home/view.dart';

import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';
import '../../core/design/login_or_register.dart';
import '../../core/logic/input_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(24.r),
            children: [
              AppImage(
                "login.png",
                height: 180.h,
                marginBottom: 16.h,
              ),
              Text(
                "Welcome To",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                "Tranquility",
                style: TextStyle(
                  fontSize: 48.sp,
                  fontFamily: "MyStery",
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              AppInput(
                validator: InputValidator.phone,
                labelText: "Phone Number",
                keyboardType: TextInputType.phone,
              ),
              AppInput(
                labelText: "Password",
                isPassword: true,
                validator: InputValidator.password,
                marginBottom: 4.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    navigateTo(ForgetPasswordView());
                  },
                  child: Text("Forget Password ?"),
                ),
              ),
              SizedBox(height: 16.h),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    navigateTo(HomeView());
                  }
                },
                child: Text("Log In"),
              ),
              LoginOrRegister(),
              SizedBox(height: 16.h),
              _SocialMediaButton(
                  image: "google.png", color: Color(0xff35B542), text: "Login With Google"),
              _SocialMediaButton(
                  image: "facebook.png", color: Color(0xff518EF8), text: "Login With Facebook"),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialMediaButton extends StatelessWidget {
  final String image, text;
  final Color color;

  const _SocialMediaButton({Key? key, required this.image, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.symmetric(vertical: BorderSide(color: color.withOpacity(.5), width: 3))),
      child: Row(
        children: [
          AppImage(
            image,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              color: color.withOpacity(.5),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
