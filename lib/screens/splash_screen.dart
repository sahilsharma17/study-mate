import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'package:study_buddy/screens/home.dart';
import 'package:study_buddy/screens/welcome_screen.dart';

class SplashScreenOld extends StatefulWidget {
  @override
  State<SplashScreenOld> createState() => _SplashScreenOldState();
}

class _SplashScreenOldState extends State<SplashScreenOld> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // You can use any loading indicator
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkUserLoggedInStatus();
  }

  void checkUserLoggedInStatus() async {
    MyAuthProvider ap = Provider.of<MyAuthProvider>(context, listen: false);
    bool isLoggedIn = ap.isSignedIn;


    // FirebaseAuth auth = FirebaseAuth.instance;

    await Future.delayed(const Duration(seconds: 2));

    if (isLoggedIn==true) {
      Get.offAll(() => const Home());
    } else {
      Get.offAll(() => const WelcomeScreen());
    }
  }
}
