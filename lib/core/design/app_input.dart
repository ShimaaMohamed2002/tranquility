import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  final String? labelText;
  final bool isPassword;
  final double? marginBottom;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isMultiLine;

  const AppInput({
    Key? key,
    this.labelText,
    this.isPassword = false,
    this.isMultiLine =false,
    this.controller,
    this.validator,  this.marginBottom, this.keyboardType,
  }) : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: widget.marginBottom??16),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        maxLines: widget.isMultiLine?3:1,

        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        obscureText: isHidden && widget.isPassword,
        validator: widget.validator,
        decoration: InputDecoration(
            labelText: widget.labelText,
            contentPadding:  EdgeInsets.symmetric(horizontal: 16.w),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      isHidden = !isHidden;
                      setState(() {});
                    },
                    child: Icon(
                      isHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null),
      ),
    );
  }
}
