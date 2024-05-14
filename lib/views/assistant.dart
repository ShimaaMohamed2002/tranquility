import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/design/app_image.dart';
import 'package:tranquility/core/design/app_input.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/chatting.dart';

class AssistantView extends StatefulWidget {
  const AssistantView({Key? key}) : super(key: key);

  @override
  State<AssistantView> createState() => _AssistantViewState();
}

class _AssistantViewState extends State<AssistantView> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20.r).copyWith(top: 60.h),
              width: double.infinity,
              color: Theme.of(context).primaryColor.withOpacity(.13),
              child: Column(
                children: [
                  AppImage(
                    "chat_bot.svg",
                    height: 157.h,
                    width: 157.h,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "Hey!",
                    style: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "I’am your Personal Assistent",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 70.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Make New Chat",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppInput(
                    controller: titleController,
                    labelText: "Title Of Chat",
                    marginBottom: 24.h,
                  ),
                  FilledButton(
                    onPressed: () {
                      navigateTo(ChattingView(
                        title: titleController.text,
                      ));
                    },
                    child: Text("Start Chat"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
