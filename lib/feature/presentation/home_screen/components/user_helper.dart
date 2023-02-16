// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:jobtask/feature/presentation/home_screen/components/user_model.dart';

// class UserHelper {
//   Future<UserModel?> getUsers() async {
//     Response response =
//         await http.get(Uri.parse('https://reqres.in/api/users'));
//     var json = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       return UserModel.fromJson(json);
//     } else {
//       return UserModel.fromJson(json);
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';

Future<UserModel> getUsers() async {
  Response response = await http.get(Uri.parse('https://reqres.in/api/users'));
  var json = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return UserModel.fromJson(json);
  } else {
    return UserModel.fromJson(json);
  }
}
