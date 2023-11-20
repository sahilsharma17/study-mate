import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '03107085816', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile(
                'Address', 'abc address, xyz city', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(
                'Email', 'ahadhashmideveloper@gmail.com', CupertinoIcons.mail),
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
                ap.logOutUser();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 5),
                          color: Colors.purple.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
                child: ListTile(
                  title: const Text('Logout', style: TextStyle(color: Colors.red)),
                  leading: const Icon(CupertinoIcons.power, color: Colors.red),
                  trailing:
                      Icon(Icons.arrow_forward, color: Colors.grey.shade400),
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
                offset:const Offset(0, 5),
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
