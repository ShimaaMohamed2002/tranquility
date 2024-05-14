import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/auth/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      navigateTo(OnBoardingView(), keepHistory: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BounceInDown(
          duration: Duration(seconds: 2),
          child: CircleAvatar(
            radius: 180.r,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Tranquility",
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontFamily: "MyStery",
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    "Together Towards Tranquility",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
          ),
        ),
      ),
    );
  }
}
