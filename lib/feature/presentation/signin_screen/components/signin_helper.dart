import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobtask/core/functions/sharedPref.dart';
import 'package:jobtask/core/utils/constents/strings_manager.dart';
import 'package:one_clicks_eats/business_logic/shared_preferences.dart';
import 'package:one_clicks_eats/const/app_string.dart';
import 'package:one_clicks_eats/const/server_config.dart';
import 'package:one_clicks_eats/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:one_clicks_eats/ui/routes/route.dart';


class LogInHelper {

  bool isSelected = false;
  Future<SigninModel?> login(dynamic emailORPhone, String password) async {
    try {
      String url = "https://reqres.in/api/users";
      
      var headers = {"Accept": "application/json"};
      LoginModel? jsonData;

      Map body = {
        "email": emailORPhone,
        "password": password,
      };
      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: headers);
      print("BODY__ $body");
      jsonData = loginModelFromJson(response.body);
      if (response.statusCode == 200) {
        if (jsonData.result == false) {
          Fluttertoast.showToast(msg: jsonData.message.toString());
        } else {
          Fluttertoast.showToast(msg: jsonData.message.toString());
          log("response__${response.body}"); //print
          if (isSelected) {
            SharedPref.setPreferences(
                AppStrings.emailOr_Phone, emailORPhone.toString());
            SharedPref.setPreferences(AppStrings.passWord, password);
            SharedPref.setPreferences(
                AppStrings.authToken, jsonData.accessToken.toString());
          }

          Get.offAllNamed(home);
          // Get.to(NextPage());
        }
        return jsonData;
      }
    } catch (e) {
      print("LOGIN ERROR__${e}");
      Fluttertoast.showToast(msg: "Error is: $e");
    }
  }
}
