import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/constants/app_colors.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'package:study_buddy/provider/database_provider.dart';
import 'package:study_buddy/screens/home.dart';
import 'package:study_buddy/services/database_service.dart';
import 'package:study_buddy/widgets/green_intro_widget.dart';
import 'dart:developer' as devTools;

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    DatabaseProvider db = Provider.of<DatabaseProvider>(context, listen: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  greenIntroWidgetWithoutLogos(),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffD6D6D6)),
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  TextFieldWidget(
                      'Name', Icons.person_outlined, nameController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      'Email', Icons.home_outlined, emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      'Phone No.', Icons.card_travel, phoneController),
                  const SizedBox(
                    height: 10,
                  ),
                  db.isLoading
                      ? CircularProgressIndicator(
                          color: Colors.purple.shade500,
                        )
                      : greenButton(
                          title: 'Submit',
                          onPressed: () async {
                            String fullName = nameController.text;
                            String email = emailController.text;
                            String phone = phoneController.text;
                            devTools.log(nameController.text);
                            devTools.log(emailController.text);
                            devTools.log(phoneController.text);
                            await db.addUserData(
                              fullName: fullName,
                              email: email,
                              phone: phone,
                            );
                            await db.checkUserDataExists();
                            Get.offAll(() => const Home());
                            devTools.log("done");
                          },
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFieldWidget(
      String title, IconData iconData, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          // height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: Colors.purple,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget greenButton({required String title, required Function onPressed}) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Colors.purple,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
