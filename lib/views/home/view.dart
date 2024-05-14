import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/design/app_image.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/assistant.dart';
import 'package:tranquility/views/home/pages/chats.dart';
import 'package:tranquility/views/home/pages/profile.dart';
import 'package:tranquility/views/home/pages/quotes.dart';
import 'package:tranquility/views/suggestions.dart';

import '../about_us.dart';
import '../auth/login.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPage = 0;
  List<String> titles = ["Chats", "Quotes", "Profile"];

  final pages = [
    _Model(title: "Chats", image: "chats.svg", page: const ChatsPage()),
    _Model(title: "Quotes", image: "quotes.svg", page: const QuotesPage()),
    _Model(title: "Profile", image: "profile.svg", page: const ProfilePage()),
  ];
  bool isEasyLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPage == 2 ? "Edit Profile" : titles[currentPage]),
      ),
      body: pages[currentPage].page,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 31.h),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25.r),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    ClipOval(
                      child: AppImage(
                        "",
                        height: 160.h,
                        width: 160.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Soso",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "01027545631",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                navigateTo(AboutUsView());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
                  bottom: 16.h,
                ),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  children: [
                    AppImage(
                      "about_us.svg",
                      height: 24.h,
                      width: 24.h,
                    ),
                    SizedBox(width: 2.5.w),
                    Text(
                      "About Us",
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                //open url
                await openUrl(
                    "https://play.google.com/store/apps/details?id=com.playrix.fishdomdd.gplay&hl=ar");
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
                  bottom: 16.h,
                ),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  children: [
                    AppImage(
                      "rate.svg",
                      height: 24.h,
                      width: 24.h,
                    ),
                    SizedBox(width: 2.5.w),
                    Text(
                      "Rate Our App",
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                navigateTo(SuggestionsView());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
                  bottom: 16.h,
                ),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  children: [
                    AppImage(
                      "suggestions.svg",
                      height: 24.h,
                      width: 24.h,
                    ),
                    SizedBox(width: 2.5.w),
                    Text(
                      "Suggestions",
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
                bottom: 16.h,
              ),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                children: [
                  AppImage(
                    "easy_login.svg",
                    height: 24.h,
                    width: 24.h,
                  ),
                  SizedBox(width: 2.5.w),
                  Expanded(
                    child: Text(
                      "Enable Easy Login",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 25.h,
                    width: 42.w,
                    child: Switch(
                      value: isEasyLogin,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        print(value);
                        isEasyLogin = value;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                navigateTo(LoginView(), keepHistory: false);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
                  bottom: 16.h,
                ),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                    color: Color(0xffFF3A3A).withOpacity(.1),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  children: [
                    AppImage(
                      "logout.svg",
                      height: 24.h,
                      width: 24.h,
                    ),
                    SizedBox(width: 2.5.w),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 16.sp, color: Color(0xffF60000)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "chat",
        onPressed: () {
          navigateTo(AssistantView());
        },
        child: const AppImage("chat_bot.svg"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          currentPage = value;
          setState(() {});
        },
        items: List.generate(
          pages.length,
          (index) => BottomNavigationBarItem(
            icon: AppImage(
              pages[index].image,
              color: index == currentPage ? null : Colors.white.withOpacity(.3),
            ),
            label: pages[index].title,
          ),
        ),
      ),
    );
  }
}

class _Model {
  late String title, image;
  late Widget page;

  _Model({required this.title, required this.image, required this.page});
}
