// // To parse this JSON data, do
// //
// //     final signInModel = signInModelFromJson(jsonString);

// import 'dart:convert';

// SignInModel signInModelFromJson(String str) =>
//     SignInModel.fromJson(json.decode(str));

// String signInModelToJson(SignInModel data) => json.encode(data.toJson());

// class SignInModel {
//   SignInModel({
//     this.id,
//     this.createdAt,
//   });

//   String? id;
//   DateTime? createdAt;

//   factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
//         id: json["id"],
//         createdAt: DateTime.parse(json["createdAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "createdAt": createdAt!.toIso8601String(),
//       };
// }
