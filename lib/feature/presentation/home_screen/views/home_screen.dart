import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobtask/core/utils/constents/font_manager.dart';
import 'package:jobtask/core/utils/themes/color_magager.dart';
import 'package:jobtask/feature/presentation/chat_screen/views/chat_screen.dart';
import 'package:jobtask/feature/presentation/home_screen/components/user_model.dart';

import '../components/user_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.wColor,
        title: const Text("Massages", style: TextStyle(color: Colors.black)),
        actions: [
          GestureDetector(
            onTap: () {
              log("tap");
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.0.w),
              child: const CircleAvatar(
                radius: 18.0,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
              ),
            ),
          )
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.gColor,
            )),
      ),
      body: Column(
        children: [
          SizedBox(height: 25.0.h),
          Padding(
            padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
            child: Row(children: [
              Expanded(
                child: SizedBox(
                  height: 55.0.h,
                  child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(height: 1.0.h),
                      ),
                      onTap: () {}),
                ),
              ),
              Container(
                height: 56.0.h,
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                color: AppColors.gColor,
                child: Row(
                  children: [
                    const Center(
                      child: Text(
                        "Filter",
                        style: TextStyle(
                            fontSize: FontSize.s17, color: AppColors.wColor),
                      ),
                    ),
                    SizedBox(width: 10.0.w),
                    Icon(Icons.view_headline, color: AppColors.wColor),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(height: 30.0.h),
          Expanded(
            child: FutureBuilder<UserModel>(
              future: getUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        var userInfo = snapshot.data!.data![index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: (() => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const ChatScreen(),
                                    ),
                                  )),
                              child: Card(
                                elevation: 10.0,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    // radius: 17.0,
                                    backgroundImage: NetworkImage(
                                      snapshot.data!.data![index].avatar
                                          .toString(),
                                    ),
                                  ),
                                  title: Text("${userInfo.firstName}"
                                      " ${userInfo.lastName}"),
                                  subtitle: Text(userInfo.email.toString()),
                                  // trailing: Text(userInfo.id.toString()),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.gColor,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
