import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_buddy/helpers/helper_functions.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'dart:developer' as devTools;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SharedPreferences? sp;
  String userName = "";
  String email = "";
  void initializeUserData() async {
    this.userName = await HelperFunctions.getUserNameFromSF() ?? "";
    this.email = await HelperFunctions.getUserEmailFromSF() ?? "";
    sp = await SharedPreferences.getInstance();
     setState(() {});
    devTools.log(userName);
  }

  void initState() {
    initializeUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MyAuthProvider ap =
        Provider.of<MyAuthProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/image1.png'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', userName, CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '9728638388', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Email', email, CupertinoIcons.mail),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Add functionality for editing the profile
            //   },
            //   child: Text('Edit Profile'),
            // ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            ap.logOutUser(); // Perform logout action
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade400,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 5),
                      color: Colors.purple.withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: ListTile(
                  title: const Text('Logout',
                      style: TextStyle(color: Colors.white)),
                  leading:
                      const Icon(CupertinoIcons.power, color: Colors.white),
                  tileColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.purple.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
