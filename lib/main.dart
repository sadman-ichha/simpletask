import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobtask/core/utils/constents/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.signinScreen,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        });
  }
}
