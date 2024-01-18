import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:study_buddy/constants/app_colors.dart';
import 'package:study_buddy/provider/database_provider.dart';
import 'package:study_buddy/screens/notes_screen/note_reader_screen.dart';

Widget noteCard(BuildContext context, QueryDocumentSnapshot note) {
  DatabaseProvider db = DatabaseProvider();
  return Slidable(
    startActionPane: ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(15),
          autoClose: true,
          spacing: 8,
          onPressed: (context) async {
            await DatabaseProvider.notesCollection
                .doc(note.id)
                .update({"is_pinned": !note["is_pinned"]});
          },
          icon: note['is_pinned'] ? Icons.thumb_down : Icons.thumb_up,
          backgroundColor: Color.fromARGB(255, 103, 172, 219),
          foregroundColor: Colors.black,
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(20),
          autoClose: true,
          spacing: 8,
          onPressed: (context) async {
            await db.deleteNote(id: note.id);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Note deleted successfully"),
              showCloseIcon: true,
              backgroundColor: Color.fromARGB(255, 164, 0, 0),
              closeIconColor: Colors.black,
              duration: Duration(seconds: 1),
            ));
          },
          icon: Icons.delete,
          backgroundColor: Colors.red.shade500,
        )
      ],
    ),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => NoteReaderScreen(note))));
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Colors.purple.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note["note_title"],
                style: mainTitle,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                note["creation_date"],
                style: dateTitle,
              ),
              const SizedBox(height: 10),
              Text(
                note["note_content"],
                style: mainContent,
                overflow: TextOverflow.fade,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
