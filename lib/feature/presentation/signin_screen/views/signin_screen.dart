

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobtask/core/functions/global_widgets/custom_button.dart';
import 'package:jobtask/core/functions/global_widgets/custom_text_field.dart';
import 'package:jobtask/core/functions/sharedPref.dart';
import 'package:jobtask/core/utils/constents/font_manager.dart';
import 'package:jobtask/core/utils/constents/strings_manager.dart';
import 'package:jobtask/core/utils/themes/color_magager.dart';
import 'package:jobtask/core/utils/themes/styles_manager.dart';
import 'package:jobtask/feature/presentation/home_screen/views/home_screen.dart';

class SignInScreeen extends StatefulWidget {
  const SignInScreeen({super.key});

  @override
  State<SignInScreeen> createState() => _SignInScreeenState();
}

class _SignInScreeenState extends State<SignInScreeen> {
  final TextEditingController emailOrPhoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  bool _isVisible = true;
  bool isSelected = false;
  bool isProgress = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 190.0.h),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      AppStrings.signinYourAccount,
                      style: TextStyle(
                          fontSize: FontSize.s26.sp,
                          fontWeight: FontWeightManager.medium),
                    ),
                  ),
                  SizedBox(height: 25.0.h),
                  CustomTextfield(
                    titleText: "Email",
                    hintsText: "Email or Phone Number",
                    controller: emailOrPhoneController,
                    validate: (val) {
                      if (val!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0.h),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: FontSize.s18.sp),
                  ),
                  SizedBox(height: 12.0.h),
                  Container(
                    color: Colors.blueGrey[100],
                    height: 60.0.h,
                    child: TextFormField(
                      controller: passController,
                      obscureText: _isVisible,
                      obscuringCharacter: "*",
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible == false
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.black45,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black45,
                                ),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                          activeColor: AppColors.gColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0.r)),
                          value: isSelected,
                          onChanged: (bool? val) {
                            setState(() {
                              isSelected = val!;
                            });
                            SharedPref.setPreferences(
                                AppStrings.rememberMe, val.toString());
                            print("isSeleceted__$isSelected");
                          }),
                      const Text(
                        "Remember Me",
                        // style: AppStyles.mySubTitleTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 22.0.w),
                  CustomButton("Sign in", () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HomeScreen()));;
                    }
                  }),
                  SizedBox(height: 28.0.w),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forgot the Password?",
                        style: TextStyle(
                            fontSize: FontSize.s16,
                            color: AppColors.gColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(height: 28.0.w),
                  Center(
                    child: AppStyles.richText(
                      "Don't Have an account? ",
                      "Sign up",
                      () {},
                      context,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
