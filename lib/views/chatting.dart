import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/design/app_image.dart';

class ChattingView extends StatefulWidget {
  final String title;

  const ChattingView({Key? key, required this.title}) : super(key: key);

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  final messageController = TextEditingController();
  final list = [
    MessageModel(isFromRobot: false, text: "Hello How are you?", date: "date"),
    MessageModel(
        isFromRobot: true,
        text:
            "Hello! I'm just a computer program, so I don't have feelings in the same way humans do, but I'm here and ready to assist you. How can I help you today?",
        date: "date"),
    MessageModel(isFromRobot: false, text: "I feel upset", date: "date"),
    MessageModel(
        isFromRobot: true,
        text:
            "I'm sorry to hear that you're feeling upset. If you'd like, you can share what's on your mind, and I'm here to listen and offer support or guidance if you need it. Remember, it's okay to feel upset sometimes, and it's important to take care of yourself.",
        date: "date"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     navigateTo(ScanFaceView());
          //   },
          //   icon: AppImage(
          //     "face_detect.svg",
          //     color: Colors.black,
          //   ),
          // ),
          IconButton(
            onPressed: () {
              // showMenu(context: context, position: position, items: items)
            },
            icon: AppImage(
              "menu.svg",
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.r).copyWith(bottom: 100.h),
        itemBuilder: (context, index) => _Item(model: list[index]),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: list.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: "write your message",
                ),
              ),
            ),
            SizedBox(width: 16.w),
            GestureDetector(
                onTap: () {
                  if (messageController.text.isNotEmpty) {
                    list.add(MessageModel(
                        isFromRobot: false, text: messageController.text, date: "date"));
                    setState(() {});
                    messageController.clear();
                  }
                },
                child: CircleAvatar(
                  radius: 30.r,
                  child: AppImage("send_message.svg"),
                )),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final MessageModel model;

  const _Item({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model.isFromRobot) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              child: AppImage(
            "robot.jpg",
            height: 36.h,
            width: 36.w,
          )),
          SizedBox(width: 8.w),
          Expanded(
              child: Container(
            child: Text(
              model.text,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Theme.of(context).primaryColor.withOpacity(.1),
            ),
          ))
        ],
      );
    }
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        child: Text(
          model.text,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class MessageModel {
  late bool isFromRobot;
  late String text, date;

  MessageModel({
    required this.isFromRobot,
    required this.text,
    required this.date,
  });
}
