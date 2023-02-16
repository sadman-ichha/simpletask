// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:jobtask/feature/presentation/home_screen/views/home_screen.dart';
// import 'package:jobtask/feature/presentation/signin_screen/components/signin_model.dart';

// class SignInHelper {
//   bool isSelected = true;
//   Future<SignInModel?> login(
//       dynamic emailORPhone, String password, context) async {
//     try {
//       var headers = {"Accept": "application/json"};
//       SignInModel? jsonData;

//       Map body = {
//         "email": emailORPhone,
//         "password": password,
//       };
//       http.Response response = await http.post(
//           Uri.parse("https://reqres.in/api/users"),
//           body: body,
//           headers: headers);
//       print("BODY__ $body");
//       jsonData = signInModelFromJson(response.body);
//       if (response.statusCode == 200) {
//         if (jsonData.id == null) {
//           Fluttertoast.showToast(msg: "Somthing went Worng");
//         } else {
//           Fluttertoast.showToast(msg: "Okey");
//           log("response__${response.body}"); //print
//           // if (isSelected) {
//           //   SharedPref.setPreferences(
//           //       AppStrings.emailOr_Phone, emailORPhone.toString());
//           //   SharedPref.setPreferences(AppStrings.passWord, password);
//           //   SharedPref.setPreferences(
//           //       AppStrings.authToken, jsonData.id.toString());
//           // }

//           return Navigator.of(context)
//               .push(MaterialPageRoute(builder: (_) => HomeScreen()));
//         }
//         return jsonData;
//       }
//     } catch (e) {
//       print("LOGIN ERROR__${e}");
//       Fluttertoast.showToast(msg: "Error is: $e");
//     }
//     return null;
//   }
// }
