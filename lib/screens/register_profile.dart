import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'package:study_buddy/services/database_service.dart';
import 'dart:developer' as devTools;

import 'package:study_buddy/widgets/custum_button.dart';

class UserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    MyAuthProvider ap = Provider.of<MyAuthProvider>(context, listen: false);
    DatabaseService db = DatabaseService(ap.getUserId);

    return Scaffold(
      appBar: AppBar(
        
        // title: const Text('User Details', ),
          title:const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User Details"),
              ],
            ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField(
            //   controller: nameController,
            //   decoration: const InputDecoration(
            //     labelText: 'Full Name',
            //     border: OutlineInputBorder(),
            //   ),
            //   textCapitalization: TextCapitalization.words,
            //   // You may need to validate and save the entered name
            //   // Assign to a variable or controller to retrieve the value later
            // ),

 TextFormField(
              controller: nameController,
              // maxLength: 10,
              decoration: InputDecoration(
               
                hintText: "Full Name",
                hintStyle: TextStyle(
                    fontSize: 15,
                  //  textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color:  Color.fromARGB(255, 190, 104, 205))),
              ),
              cursorColor: Colors.purple,
              keyboardType: TextInputType.name,
               textCapitalization: TextCapitalization.words,
            
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),





            const SizedBox(height: 20),

            // TextField(
            //   controller: emailController,
            //   decoration: const InputDecoration(
            //     labelText: 'Email ID',
            //     border: OutlineInputBorder(),
            //   ),
            //   keyboardType: TextInputType.emailAddress,
            // ),

            TextFormField(
              controller: emailController,
              // maxLength: 10,
              decoration: InputDecoration(
                
                hintText: "Email ID",
                hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color:  Color.fromARGB(255, 190, 104, 205))),
              ),
              cursorColor: Colors.purple,
              keyboardType: TextInputType.emailAddress,
            
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),




            const SizedBox(height: 20),

            // ElevatedButton(
            //   onPressed: () async {
            //     String fullName = nameController.text;
            //     String email = emailController.text;
            //     devTools.log("Called");
            //     await db.addUserData(
            //       fullName: fullName,
            //       email: email,
            //     );
            //     devTools.log("done");
            //   },
            //   child: const Text('Save Details'),
            // ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                onPressed: () async {
                  String fullName = nameController.text;
                  String email = emailController.text;
                  devTools.log("Called");
                  // await db.addUserData(
                  //   fullName: fullName,
                  //   email: email,
                  // );
                  devTools.log("done");
                },
                // child: const Text('Save Details'),
                text: "Save Details",
              ),
            )
          ],
        ),
      ),
    );
  }
}
