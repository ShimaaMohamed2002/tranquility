import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future navigateTo(Widget page, {bool keepHistory = true}) {
  final route = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
  return navigatorKey.currentState!.pushAndRemoveUntil(route, (route) => keepHistory);
}

enum MessageType { success, fail, warning }

void showMessage(String msg, {int duration = 2, MessageType type = MessageType.fail}) async {
  if (msg.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 10.h),
        elevation: 0,
        backgroundColor: getBgColor(type),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
        content: Row(
          children: [
            Expanded(
              child: Text(
                msg,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                softWrap: true,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getBgColor(MessageType msgType) {
  return msgType == MessageType.success
      ? const Color(0xff53A653)
      : msgType == MessageType.warning
          ? const Color(0xffFFCC00)
          : const Color(0xffEF233C);
}

Future<void> openUrl(String url) async {
  await launchUrl(Uri.parse(url)).catchError((ex) {
    showMessage("Can't open the url", type: MessageType.fail);
    return false;
  });
}
