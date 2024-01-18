import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:developer' as devtools show log;

import 'package:study_buddy/constants/app_colors.dart';
import 'package:study_buddy/provider/database_provider.dart';
import 'package:study_buddy/screens/notes_screen/note_card.dart';
import 'package:study_buddy/screens/notes_screen/note_editor_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final DatabaseProvider dbProvider = DatabaseProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> unpinnedNotesStream =
        dbProvider.getUnpinnedNotesStream();
    Stream<QuerySnapshot> pinnedNotesStream = dbProvider.getPinnedNotesStream();

    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("Notes"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 15),
                Text(
                  "Pinned Notes",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: pinnedNotesStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasData) {
                      return GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: snapshot.data!.docs
                            .map((note) => noteCard(context, note))
                            .toList(),
                      );
                    } else {
                      return Text(
                        "You don't have any notes",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Recent Notes",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: unpinnedNotesStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasData) {
                      return GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: snapshot.data!.docs
                            .map((note) => noteCard(context, note))
                            .toList(),
                      );
                    } else {
                      return Text(
                        "You don't have any notes",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.purple,
          onPressed: () {
            Get.to(()=> const NoteEditorScreen());
          },
          child: const Icon(Icons.add),
        ));
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Log out'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
