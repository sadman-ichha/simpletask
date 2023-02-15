import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobtask/core/utils/constents/font_manager.dart';

class CustomTextfield extends StatelessWidget {
  String hintsText;
  String titleText;
  TextEditingController controller;

  // FormFieldValidator<String> validate;

  CustomTextfield({
    super.key,
    required this.titleText,
    required this.hintsText,
    required this.controller,
    // required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStyle(fontSize: FontSize.s18.sp),
        ),
        SizedBox(height: 12.0.h),
        Container(
          color: Colors.blueGrey[100],
          height: 60.0.h,
          child: TextFormField(
            controller: controller,
            // validator: validate,
            decoration: InputDecoration(
              hintText: hintsText,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
