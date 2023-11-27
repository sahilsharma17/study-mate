import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_buddy/screens/notes_screen/notes_screen.dart';
import 'package:study_buddy/screens/pomodoro_screen/pomodoroScreen.dart';
import 'package:study_buddy/screens/session_screen/session.dart';

import '../controllers/home_controller.dart';
import 'groups_screen/group_chat_screen.dart';
import 'profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navbarItems = [
      const BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",),
      const BottomNavigationBarItem(icon: Icon(Icons.timer) , label: "Pomodoro"),
      const BottomNavigationBarItem(icon: Icon(Icons.group), label: "Groups"),
      const BottomNavigationBarItem(icon: Icon(Icons.notes) , label: "Notes"),
      const BottomNavigationBarItem(icon: Icon(Icons.person) , label: "Profile"),
    ];

    var navBody = [
      const MySessionScreen(),
      const PomodoroScreen(),
      GroupChatScreen(),
      NotesScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: 
                navBody.elementAt(controller.currentIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: 
      Obx(() =>
        BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          items: navbarItems,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
        ),
      )
    );
  }
}