// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'dart:developer' as devTools;

// import 'package:study_buddy/controllers/home_controller.dart';

// import '../constants/colors.dart';


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(HomeController());

//     var navbarItems = [
//       BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",),
//       BottomNavigationBarItem(icon: Icon(Icons.category) , label: "categories"),
//       BottomNavigationBarItem(icon: Icon(Icons.shopping_basket) , label: "cart"),
//       BottomNavigationBarItem(icon: Icon(Icons.person_2) , label: "profile"),
//     ];

//     var navBody = [
//       HomeScreen(),
//       // CategoryScreen(),
//       // CartScreen(),
//       // ProfileScreen(),
//     ];

//     return Scaffold(
//       body: Column(
//         children: [
//           Obx(() => Expanded(
//               child: 
//                 navBody.elementAt(controller.currentIndex.value),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: 
//       Obx(() =>
//         BottomNavigationBar(
//           currentIndex: controller.currentIndex.value,
//           backgroundColor: whiteColor,
//           selectedItemColor: redColor,
//           unselectedItemColor: fontGrey,
//           // selectedLabelStyle: const TextStyle(fontFamily: semibold),
//           type: BottomNavigationBarType.fixed,
//           items: navbarItems,
//           onTap: (value) {
//             controller.currentIndex.value = value;
//           },
//         ),
//       )
//     );
    
//   }
// }

import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}