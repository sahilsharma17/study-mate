import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/constants/image_striing.dart';
import 'package:study_buddy/constants/sizes.dart';
import 'package:study_buddy/constants/colors.dart';
import 'package:study_buddy/constants/strings.dart';
import 'package:study_buddy/fade_in_animation/animation_design.dart';
import 'dart:developer' as devTools;
import 'package:study_buddy/fade_in_animation/fade_in_animation_controller.dart';
import 'package:study_buddy/fade_in_animation/fade_in_animatioon_model.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'package:study_buddy/screens/home.dart';
import 'package:study_buddy/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    // Observe the animation completion state

    // Listen for changes in the animationCompleted state
    // ever(controller.animate, (bool animationState) {
    //    if (!animationState) {
    //      // Navigate to WelcomeScreen when animation is no longer active
    //     Get.off(RegistrationScreen());
    //    }
    //  });

    controller.startSplashAnimation();
    return Scaffold(
        body: Stack(
      children: [
        TFadeInAnimation(
          durationInMs: 1600,
          animate: TAnimatePosition(
            topAfter: 0,
            topBefore: -30,
            leftBefore: -30,
            leftAfter: 0,
          ),
          child: const Image(image: AssetImage(tSplashTopIcon)),
        ),
        TFadeInAnimation(
          durationInMs: 2000,
          animate: TAnimatePosition(
            topAfter: 80,
            topBefore: 80,
            leftBefore: -80,
            leftAfter: tDefaultSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(tAppName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              Text(
                tAppTagLine,
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
        ),
        TFadeInAnimation(
          durationInMs: 2400,
          animate: TAnimatePosition(
              bottomBefore: 0,
              bottonAfter: 60,
              rightBefore: tDefaultSize,
              rightAfter: tDefaultSize),
          child: Container(
            width: tSplashContainerSize,
            height: tSplashContainerSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: tPrimaryColor,
            ),
          ),
        ),
      ],
    ));
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

    await Future.delayed(const Duration(seconds: 3));
    devTools.log(isLoggedIn.toString());
    if (isLoggedIn == true) {
      Get.offAll(() => const Home());
    } else {
      Get.offAll(() => const WelcomeScreen());
    }
  }
}
