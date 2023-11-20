import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:study_buddy/screens/pomodoro_screen/utils.dart';
import 'package:study_buddy/screens/session_screen/ui/add_task_bar.dart';
import 'package:study_buddy/screens/session_screen/ui/theme.dart';
import 'package:study_buddy/screens/session_screen/ui/widgets/button.dart';

class MySessionPage extends StatefulWidget {
  const MySessionPage({super.key});

  @override
  State<MySessionPage> createState() => _MySessionPageState();
}

class _MySessionPageState extends State<MySessionPage> {
  DateTime _selectedDate = DateTime.now();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.purple.shade500,
        title: Text("Session", 
        style: textStyle(
              Size: 25.0, color: Colors.white, fontWeight: FontWeight.w400),),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()),
                      style: subHeadingStyle,
                      ),
                       Text("Today",
                       style: headingStyle,
                       )
                    ],
                  ),
                ),
                      MyButton(
        label: "+ Add Task",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskBar()),
          );
        },
      ),

              ],
            ),
          ),


          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 120,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.purple.shade400,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                )
              ),
              dayTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                )
              ),
              monthTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                )
              ),
              onDateChange: (date){
                _selectedDate = date;
              },
            ),
          ),
        ],
      ),
    );
  }
}
