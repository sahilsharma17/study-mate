import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/controllers/theme_provider.dart';
import 'package:study_buddy/controllers/todo_provider.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'package:study_buddy/screens/home_screen.dart';
import 'package:study_buddy/screens/otp_screen.dart';
import 'package:study_buddy/screens/profile_settings.dart';
import 'package:study_buddy/screens/registration_screen.dart';
import 'package:study_buddy/screens/splash_screen/splash_screen.dart';
import 'dart:developer' as devTools;

import 'firebase_options.dart';
import 'screens/pomodoro_screen/timer_service.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCDsDpab6oqND1NNE-CQ_E4Zp5YXWPjWpk",
            authDomain: "study-buddy-fed3e.firebaseapp.com",
            projectId: "study-buddy-fed3e",
            storageBucket: "study-buddy-fed3e.appspot.com",
            messagingSenderId: "573912425768",
            appId: "1:573912425768:web:578b61eaabe1089919dc1d"));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(
  //   ChangeNotifierProvider<TimerService>(
  //   create: (_) => TimerService(),
  //   child: const MyApp(),
  // )
  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TimerService(),),
        ChangeNotifierProvider(create: (_) => MyAuthProvider()),
      ],
      child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: UserDetailsPage(),
      //  home: ProfileSettingScreen(),
        home:  const SplashScreen(),
      title: "Study Buddy",
      routes: {
        "home_screen": (context) => const HomeScreen(),
        "registration_screen": (context) => const RegistrationScreen(),
        "otp_screen": (context) => const OtpScreen(),
      },
    );
  }
}
