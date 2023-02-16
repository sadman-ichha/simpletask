import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_magager.dart';

class AppStyles {
static  RichText richText(String firstText, String secText, navigatePage, context) =>
      RichText(
        text: TextSpan(
            text: firstText,
            style: TextStyle(
              fontSize: 18.0.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF707B81),
            ),
            children: [
              TextSpan(
                text: secText,
                style: TextStyle(
                    fontSize: 19.0.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              )
            ]),
      );
}
