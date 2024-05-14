import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tranquility/core/design/app_image.dart';
import 'package:tranquility/core/design/app_input.dart';

const profileImage = "https://engineering.unl.edu/images/staff/Kayla-Person.jpg";

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userNameController = TextEditingController(text: "Shosho");
  final phoneController = TextEditingController(text: "01027545631");
  final ageController = TextEditingController(text: "22");
  final genderController = TextEditingController(text: "Female");

  XFile? selectedImage;

  void chooseImage(ImageSource source) async {
    XFile? result = await ImagePicker().pickImage(source: source);
    print("Result :");
    print(result?.path);
    Navigator.pop(context);
    if (result != null) {
      selectedImage = result;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                height: 160.h,
                width: 160.h,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ClipOval(
                      child: AppImage(
                        selectedImage != null ? selectedImage!.path : profileImage,
                        height: 160.h,
                        width: 160.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
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
                                                    fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                                    fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                        child: CircleAvatar(
                          radius: 26.r,
                          child: AppImage("edit.svg"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.h
            ),
            AppInput(
              controller: userNameController,
              labelText: "Username",
            ),
            AppInput(
              controller: phoneController,
              labelText: "Phone Number",
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
            SizedBox(height: 24.h),
            FilledButton(onPressed: () {}, child: Text("Save")),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
