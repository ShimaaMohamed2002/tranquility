import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/design/app_empty.dart';
import 'package:tranquility/core/design/app_image.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/chatting.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final list = [
    ChatModel(title: "About Work", date: "10/12/2021"),
    ChatModel(title: "About My Family", date: "03/05/2022"),
    ChatModel(title: "My self", date: "26/03/2024"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.isEmpty
          ? const Center(
              child: AppEmpty(
                title: "You don’t have any Chats yet.",
                image: "chats.svg",
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(16.r).copyWith(
                top: 8.h,
              ),
              itemBuilder: (context, index) => _Item(
                model: list[index],
                onDelete: () {
                  list.removeAt(index);
                  setState(() {});
                },
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: list.length,
            ),
    );
  }
}

class _Item extends StatelessWidget {
  final ChatModel model;
  final VoidCallback onDelete;

  const _Item({Key? key, required this.model, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              navigateTo(ChattingView(title: model.title));
            },
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Text(
                    model.title,
                    style:  TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    model.date,
                    style:  TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
         SizedBox(width: 2.w),
        IconButton(onPressed: onDelete, icon: const AppImage("delete.svg")),
      ],
    );
  }
}

class ChatModel {
  final String title, date;

  ChatModel({required this.title, required this.date});
}
