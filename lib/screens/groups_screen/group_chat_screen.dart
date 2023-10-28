import 'package:flutter/material.dart';

class GroupChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Group Chat'),
          backgroundColor: Colors.purple, // Set the app bar color to purple.
        ),
        body: GroupListScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add code to create a new group.
          },
          backgroundColor: Colors.purple, // Set the button's background color to purple.
          child: Icon(Icons.group_add_outlined),
        ),
      ),
    );
  }
}

class GroupListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groupList.length,
      itemBuilder: (context, index) {
        final group = groupList[index];
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(group.image),
              ),
              title: Text(group.name),
              subtitle: Text(group.lastMessage),
              onTap: () {
                // Navigate to the group chat screen for the selected group.
              },
            ),
            Divider(thickness: 1.5),
          ],
        );
      },
    );
  }
}

class Group {
  final String name;
  final String image;
  final String lastMessage;

  Group(this.name, this.image, this.lastMessage);
}

final List<Group> groupList = [
  // Add your groups here.
  Group('Group 1', 'assets/image1.png', 'Last message from Group 1'),
  Group('Group 2', 'assets/image2.png', 'Last message from Group 2'),
  Group('Group 3', 'assets/image3.png', 'Last message from Group 3'),
  Group('Group 3', 'assets/image3.png', 'Last message from Group 3'),
  Group('Group 3', 'assets/image3.png', 'Last message from Group 3'),
  Group('Group 3', 'assets/image3.png', 'Last message from Group 3'),
  Group('Group 3', 'assets/image3.png', 'Last message from Group 3'),
  Group('Group 3', 'assets/image3.png', 'Last message from Group 3'),
  Group('Group 3', 'assets/image3.png', 'Last message from Group 3'),
  Group('Group 3', 'assets/image3.png', 'Last message from Group 3'),
];
