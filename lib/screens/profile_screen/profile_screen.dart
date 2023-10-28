import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/image1.png'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '03107085816', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'abc address, xyz city', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'ahadhashmideveloper@gmail.com', CupertinoIcons.mail),
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
                // Implement logout action here
                showLogoutDialog(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.purple.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10
                      )
                    ]
                ),
                child: ListTile(
                  title: Text('Logout', style: TextStyle(color: Colors.red)),
                  leading: Icon(CupertinoIcons.power, color: Colors.red),
                  trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
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
                offset: Offset(0, 5),
                color: Colors.purple.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }

  showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement logout action here
                Navigator.of(context).pop();
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
