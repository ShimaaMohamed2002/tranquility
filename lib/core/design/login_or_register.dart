import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/auth/register.dart';

class LoginOrRegister extends StatelessWidget {
  final bool isLogin;
  final double? marginTop;

  const LoginOrRegister({Key? key, this.isLogin = true, this.marginTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: marginTop ?? 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isLogin ? "Don’t have an account ?" : "Already have an account ?",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
            TextButton(
              onPressed: () {
                if (isLogin) {
                  navigateTo(RegisterView());
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(isLogin ? "Sign up" : "Login"),
            )
          ],
        ),
      ),
    );
  }
}
