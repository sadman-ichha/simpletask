import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobtask/core/utils/themes/color_magager.dart';

class CustomButton extends StatelessWidget {
  String buttonName;
  Function onAction;

  CustomButton(this.buttonName, this.onAction);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onAction();
        },
        child: Container(
            height: 50.0.h,
          // width: 307.0.w,
          decoration: BoxDecoration(
            color: AppColors.gColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0.r),
            ),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                  fontSize: 22.0.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFFFFFFF)),
            ),
          ),
        ));
  }
}