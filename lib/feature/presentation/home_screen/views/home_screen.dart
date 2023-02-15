import 'package:flutter/material.dart';
import 'package:jobtask/core/utils/themes/color_magager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: false,
       centerTitle: true,
       backgroundColor: AppColors.gColor,
        title: const Text("Users"),),
      body:  ,
    );
  }
}
