import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const primary = Color(0xff284243);
  static const secondary = Color(0xffF7715B);
  static const fontFamily = "Inter";
  static const appName = "Tranquility";

  static get light => ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            0xff284243,
            {
              50: primary.withOpacity(.1),
              100: primary.withOpacity(.2),
              200: primary.withOpacity(.3),
              300: primary.withOpacity(.4),
              400: primary.withOpacity(.5),
              500: primary.withOpacity(.6),
              600: primary.withOpacity(.7),
              700: primary.withOpacity(.8),
              800: primary.withOpacity(.9),
              900: primary,
            },
          ),
          backgroundColor: Colors.white,
        ),
        fontFamily: fontFamily,
        useMaterial3: true,
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith(
            (states) {
              if (!states.contains(MaterialState.selected)) {
                return Color(0xffC0C0C0);
              }
              return primary;
            },
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primary,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.3),
          selectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            height: 2.h,
            color: Colors.white,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            height: 2.h,
            color: Colors.white.withOpacity(.3),
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
          filled: true,
          isDense: true,
          fillColor: primary.withOpacity(.03),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: primary.withOpacity(.29),
            ),
          ),
        )),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 24.sp,
              fontFamily: fontFamily,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            )),
        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                textStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                fixedSize:  Size.fromHeight(60.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ))),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: primary.withOpacity(.03),
          labelStyle: TextStyle(fontSize: 16.sp),
          // contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
          floatingLabelStyle: TextStyle(fontSize: 20.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: primary.withOpacity(.29),
            ),
          ),
        ),
      );
}
