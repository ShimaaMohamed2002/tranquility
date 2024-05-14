import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/design/app_button.dart';
import '../core/design/app_image.dart';
import '../core/design/app_input.dart';
import '../core/logic/helper_methods.dart';
import '../core/logic/input_validator.dart';

class SuggestionsView extends StatefulWidget {
  const SuggestionsView({Key? key}) : super(key: key);

  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}

class _SuggestionsViewState extends State<SuggestionsView> {
  final subjectController = TextEditingController();
  final bodyController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suggestions")),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              openUrl(
                "mailto:amramer622@gmail.com?subject=${subjectController.text}&body=${bodyController.text}",
              );
            },
            child: AppImage(
              "gmail.png",
              height: 60.h,
              width: 60.h,
            ),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
              onTap: () {
                openUrl("sms:01027545022");
              },
              child: AppImage(
                "whats_app.png",
                height: 60.h,
                width: 60.h,
              )),
        ],
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: AppImage(
                  "suggestion.png",
                  height: 170.h,
                  width: 170.h,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Tell Us How We Can Help",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 50.h),
              AppInput(
                labelText: "Subject",
                validator: (value) => InputValidator.normalInput("Subject", value),
                controller: subjectController,
              ),
              AppInput(
                labelText: "body",
                controller: bodyController,
                isMultiLine: true,
                validator: (value) => InputValidator.normalInput("Body", value, length: 10),
              ),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("Valid Data");
                    formKey.currentState!.reset();
                  } else {
                    print("Invalid Data");
                  }
                },
                text: "Send Message",
              ),
              SizedBox(height: 36.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Our Social Media Pages",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppImage(
                          "facebook.png",
                          height: 32.h,
                          width: 32.h,
                        ),
                        SizedBox(width: 32.w),
                        GestureDetector(
                          onTap: () {
                            openUrl("https://www.instagram.com/amit_learning/?hl=en");
                          },
                          child: AppImage(
                            "instagram.png",
                            height: 32.h,
                            width: 32.h,
                          ),
                        ),
                        SizedBox(width: 32.w),
                        GestureDetector(
                          onTap: () {
                            openUrl("https://www.linkedin.com/company/amit-learning/mycompany/");
                          },
                          child: AppImage(
                            "linkedin.png",
                            height: 32.h,
                            width: 32.h,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "or visit our website",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: () {
                        openUrl("https://amit-learning.com/");
                      },
                      child: AppImage(
                        "website.png",
                        height: 32.h,
                        width: 32.w,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
