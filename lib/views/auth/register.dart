import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tranquility/core/design/login_or_register.dart';
import 'package:tranquility/core/logic/helper_methods.dart';
import 'package:tranquility/views/auth/otp.dart';

import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(24.r),
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) => Container(
                    padding: EdgeInsets.all(24.r).copyWith(top: 50.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pick Image From...",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 29.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => chooseImage(ImageSource.camera),
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    AppImage("camera.svg"),
                                    Text(
                                      "Camera",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 72.w),
                            GestureDetector(
                              onTap: () => chooseImage(ImageSource.gallery),
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    AppImage("gallery.svg"),
                                    Text(
                                      "Gallery",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                height: 160.h,
                width: 160.h,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ClipOval(
                      child: AppImage(
                        selectedImage != null ? selectedImage!.path : "pick_image.svg",
                        height: 160.h,
                        width: 160.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: CircleAvatar(
                        radius: 26.r,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          AppInput(labelText: "Username"),
          AppInput(
            labelText: "Phone Number",
            keyboardType: TextInputType.phone,
          ),
          AppInput(
            controller: ageController,
            labelText: "Age",
          ),
          DropdownMenu(
            label: Text("Gender"),
            controller: genderController,
            trailingIcon: AppImage("arrow_down.svg"),
            expandedInsets: EdgeInsets.zero,
            dropdownMenuEntries: [
              DropdownMenuEntry(value: "Male", label: "Male"),
              DropdownMenuEntry(value: "Female", label: "Female"),
            ],
          ),
          SizedBox(height: 16.h),
          AppInput(
            labelText: "Password",
            isPassword: true,
          ),
          AppInput(
            labelText: "Confirm New Password",
            isPassword: true,
            marginBottom: 24.h
          ),
          FilledButton(
            onPressed: () {
              navigateTo(OTPView(
                isAfterRegister: true,
              ));
            },
            child: Text("Sign Up"),
          ),
          LoginOrRegister(isLogin: false, marginTop: 12.h),
        ],
      ),
    );
  }

  void chooseImage(ImageSource source) async {
    // todo: open camera to take image
    XFile? result = await ImagePicker().pickImage(source: source);
    print("Result :");
    print(result?.path);
    Navigator.pop(context);
    if (result != null) {
      selectedImage = result;
      setState(() {});
    }
  }
}
