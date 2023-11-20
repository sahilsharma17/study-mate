import 'package:flutter/material.dart';
import 'package:study_buddy/screens/pomodoro_screen/utils.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.purple, // Change the app bar color to purple
          title: Text('Notes',
          style: textStyle(
              Size: 25.0, color: Colors.white, fontWeight: FontWeight.w400),),
        ),
        body: NotesSection(),
      ),
    );
  }
}

class NotesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Button for audio-to-text
            ElevatedButton.icon(
              onPressed: () {
                // Add code to record audio and convert it to text.
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(120, 40),
              ),
              icon: Icon(Icons.mic, size: 20, color: Colors.white,),
              label: Text(
                'Audio',
                style: TextStyle(fontSize: 14, color: Colors.white,),
              ),
            ),
        
            // Button for image-to-text
            ElevatedButton.icon(
              onPressed: () {
                // Add code to capture or select an image and convert it to text.
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(120, 40),
              ),
              icon: Icon(Icons.image, size: 20, color: Colors.white,),
              label: Text(
                'Image',
                style: TextStyle(fontSize: 14, color: Colors.white,),
              ),
            ),
        
            // Button for copy-paste text
            ElevatedButton.icon(
              onPressed: () {
                // Add code to copy and paste text.
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(120, 40),
              ),
              icon: Icon(Icons.content_copy, size: 20, color: Colors.white,),
              label: Text(
                'Copy-Paste',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
