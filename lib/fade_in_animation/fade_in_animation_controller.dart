// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController  get find => Get.find();

  RxBool animate = false.obs;

  RxBool get animationState => animate;
  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value=false;
     await Future.delayed(const Duration(milliseconds: 5000));
      // animate.value = true; 
      // Get.offAll(const SplashScreen());
    // Get.offAll(const WelcomeScreen());
  }

    Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  
  }
}
