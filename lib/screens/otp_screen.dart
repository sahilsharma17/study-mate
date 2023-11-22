import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:developer' as devTools;
import 'package:provider/provider.dart';
import 'package:study_buddy/helpers/helper_functions.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'package:study_buddy/screens/home.dart';
import 'package:study_buddy/screens/profile_settings.dart';
import 'package:study_buddy/screens/register_profile.dart';
import 'package:study_buddy/utilities/snack_bar.dart';
import 'package:study_buddy/widgets/custum_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final verificationID = ModalRoute.of(context)?.settings.arguments as String;
    final isLoading =
        Provider.of<MyAuthProvider>(context, listen: true).isLoading;

    TextEditingController otpController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 35,
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple.shade50,
                    ),
                    padding: const EdgeInsets.all(20),
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/image3.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We sent an OTP your way, we are trying to fill it for you",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PinCodeTextField(
                    onCompleted: (value) {
                      verifyOtp(context, value, verificationID);
                    },
                    appContext: context,
                    length: 6,
                    pinTheme: PinTheme(
                      fieldHeight: 50,
                      fieldWidth: 40,
                      selectedColor: Colors.purple.shade700,
                      inactiveColor: Colors.purple.shade300,
                      activeFillColor: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(10),
                      shape: PinCodeFieldShape.box,
                      activeColor: Colors.purple.shade200,
                      selectedBorderWidth: 2,
                    ),
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  isLoading == true
                      ? const CircularProgressIndicator(
                          color: Colors.purple,
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: CustomButton(
                            text: "Verify OTP",
                            onPressed: () {
                              String userOtp = otpController.text.trim();
                              if (userOtp.length < 6) {
                                snackBar(
                                    context, "Please enter a valid OTP", 'red');
                              } else {
                                verifyOtp(context, userOtp, verificationID);
                              }
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Didn't recieve any code?",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Get a new one",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp, String verificationId) {
    final ap = Provider.of<MyAuthProvider>(context, listen: false);
    try {
      ap.verifyOtp(
          context: context,
          userOtp: userOtp,
          verificationId: verificationId,
          onSuccess: () async {
            bool dataExists = await ap.checkUserDataexists();
            await HelperFunctions.saveLoggedInUserId(ap.getUserId);
            String? uid = await HelperFunctions.getLoggedInUserId();
            devTools.log("User ID:");
            devTools.log(uid ?? "Not saved");
            dataExists
                ? Get.offAll(() => const Home())
                // : Get.offAll(() => UserDetailsPage());
                     : Get.offAll(() => ProfileSettingScreen());
          });
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message.toString(), 'red');
    }
  }
}
