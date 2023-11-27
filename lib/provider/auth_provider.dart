import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:study_buddy/screens/registration_screen.dart';
import 'package:study_buddy/services/database_service.dart';
import 'package:study_buddy/utilities/snack_bar.dart';
import 'dart:developer' as devTools;

class MyAuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get isSignedIn => _isSignedIn;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? _uid;
  String? get getUserId => _firebaseAuth.currentUser?.uid;

  MyAuthProvider() {
    devTools.log("MyAuthProvider initiated");
    checkSignedin();
  }

  void checkSignedin() async {
    _isSignedIn = (_firebaseAuth.currentUser?.uid != null) ? true : false;
    devTools.log(_isSignedIn.toString());
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          snackBar(context, "Something Went Wrong Please try again", 'red');
          _isLoading = false;
        },
        codeSent: (verificationId, forceResendingToken) {
          devTools.log(verificationId);
          Navigator.pushNamed(context, 'otp_screen', arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
      _isLoading = false;
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      snackBar(context, "Something Went Wrong Please try again", 'red');
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String userOtp,
    required String verificationId,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    PhoneAuthCredential creds = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: userOtp);
    try {
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
      if (user != null) {
        _uid = user.uid;

        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message.toString(), 'red');
    }

    _isLoading = false;
    notifyListeners();
  }

  void logOutUser() async {
    await _firebaseAuth.signOut();
    devTools.log("Logged Out");
    Get.offAll(() => const RegistrationScreen());
  }

  Future<bool> checkUserDataexists() async {
    _isLoading = true;
    notifyListeners();
    DatabaseService databaseService = DatabaseService(uid: _uid);
    bool res = await databaseService.checkUserDataExists();
    _isLoading = false;
    notifyListeners();
    return res;
  }
}
