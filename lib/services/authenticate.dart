
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/screens/home.dart';
import 'package:study_buddy/screens/welcome_screen.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return Home();
    } else {
      return WelcomeScreen();
    }
  }
}
