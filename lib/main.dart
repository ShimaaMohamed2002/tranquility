import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/core/theme.dart';
import 'package:tranquility/views/auth/splash.dart';
import 'package:tranquility/views/home/view.dart';

void main() async {
  await init();

  runApp(const MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: const HomeView(),
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: AppTheme.appName,
            theme: AppTheme.light,
            debugShowCheckedModeBanner: false,
            home: child,
          );
        });
  }
}

/*
1. need register
take
image
username
phone
age
gender
password
2. need login
take
phone
password

3. need forget password
take
phone

4. need verify
take
phone
code

5. need quotes
return some items

6. need chats
return some items

7. need  delete chat
take id


 */
