import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj/models/user_model.dart';
import 'package:proj/services/api_service.dart';
import 'package:shimmer/shimmer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _profileState();
}

class _profileState extends State<Profile> {
//create instance
  final ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          elevation: 1,
          automaticallyImplyLeading: true,
        ),
        body: FutureBuilder<UserModel>(
            future: apiServices.fetchUserData(),
            builder: (context, AsyncSnapshot<UserModel> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: ((context, index) {
                      var data = snapshot.data!.data![index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(data.firstName ?? ""),
                            subtitle: Text(data.email ?? "error"),
                            leading: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    NetworkImage(data.avatar ?? "logo")),
                          ),
                          const Divider(),
                        ],
                      );
                    }));
              } else {
                return SizedBox(
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade300,
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListTile(
                                leading: const CircleAvatar(radius: 40),
                                contentPadding:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                title: Container(
                                    height: 20, width: 70, color: Colors.blue),
                                subtitle: Container(
                                    height: 20, width: 130, color: Colors.grey),
                              ),
                            );
                          }))),
                );
              }
            }),
      ),
    );
  }
}
