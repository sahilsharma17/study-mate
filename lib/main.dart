import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'package:study_buddy/screens/home_screen.dart';
import 'package:study_buddy/screens/otp_screen.dart';
import 'package:study_buddy/screens/registration_screen.dart';
import 'package:study_buddy/screens/welcome_screen.dart';
import 'dart:developer' as devTools;


import 'firebase_options.dart';
import 'screens/home.dart';
import 'screens/pomodoro_screen/timer_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider<TimerService>(
    create:(_)=>TimerService(),
    child:MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  WelcomeScreen(),
        title: "Study Buddy",
        routes: {
          "home_screen":(context) => const HomeScreen(),
          "registration_screen":(context) => const RegistrationScreen(),
          "otp_screen":(context) => const OtpScreen(),
        },
      ),
    );
  }
}
