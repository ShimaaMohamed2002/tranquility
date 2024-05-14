import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/design/app_image.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/auth/login.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final list = [
    _OnBoardingModel(
        image: "on_boarding1.jpg",
        title: "Feel Free",
        desc: "because I'm the friendly chatbot here to assist you with anything you need."),
    _OnBoardingModel(
        image: "on_boarding2.jpg",
        title: "Ask For Anything",
        desc:
            "I'm your friendly neighborhood chatbot ready to assist you with any questions or concerns."),
    _OnBoardingModel(
        image: "on_boarding3.jpg",
        title: "Your Secert is Save",
        desc: "Our platform prioritizes your privacy and security"),
  ];
  int currentPage = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                currentPage = value;
                setState(() {});
              },
              itemBuilder: (context, index) => AppImage(
                list[index].image,
                width: double.infinity,
              ),
              itemCount: list.length,
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    list[currentPage].title,
                    style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8.h),
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        list[currentPage].desc,
                        style: TextStyle(fontSize: 22.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      navigateTo(LoginView(), keepHistory: false);
                    },
                    child: Text("skip")),
                FloatingActionButton(
                  onPressed: () {
                    if (currentPage == list.length - 1) {
                      navigateTo(LoginView(), keepHistory: false);
                    } else {
                      currentPage++;
                      pageController.animateToPage(currentPage,
                          duration: Duration(milliseconds: 300), curve: Curves.linear);

                      setState(() {});
                    }
                  },
                  child: AppImage("arrow_forward.svg"),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class _OnBoardingModel {
  final String image, title, desc;

  _OnBoardingModel({required this.image, required this.title, required this.desc});
}
