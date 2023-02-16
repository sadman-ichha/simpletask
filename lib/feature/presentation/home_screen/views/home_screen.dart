import 'package:flutter/material.dart';
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
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.gColor,
          title: const Text("Users Info")),
      body: FutureBuilder<UserModel>(
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
                            trailing: CircleAvatar(
                              // radius: 17.0,
                              backgroundImage: NetworkImage(
                                snapshot.data!.data![index].avatar.toString(),
                              ),
                            ),
                            title: Text("${userInfo.firstName}"
                                " ${userInfo.lastName}"),
                            subtitle: Text(userInfo.email.toString()),
                            leading: Text(userInfo.id.toString()),
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
    );
  }
}
