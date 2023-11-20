import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:study_buddy/constants/colors.dart';
import 'package:study_buddy/screens/session_screen/ui/theme.dart';
import 'package:study_buddy/screens/session_screen/ui/widgets/button.dart';
import 'package:study_buddy/screens/session_screen/ui/widgets/input_field.dart';

class AddTaskBar extends StatefulWidget {
  const AddTaskBar({super.key});

  @override
  State<AddTaskBar> createState() => _AddTaskBarState();
}

class _AddTaskBarState extends State<AddTaskBar> {
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];

  String selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
            backgroundColor: Colors.purple.shade500,
            elevation: 10,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            title: Text(
              "Add Task",
              style: TextStyle(color: Colors.white),
            )),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  // Text(
                  //   "Add Task",
                  //   style: headingStyle,
                  // ),
                  const MyInputField(title: "Title", hint: "Enter your title"),
                  const MyInputField(title: "Note", hint: "Enter note here"),
                  MyInputField(
                    title: "Date",
                    hint: DateFormat.yMd().format(_selectedDate),
                    widget: IconButton(
                      icon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        getDateFromUser();
                      },
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: MyInputField(
                          title: "Start Date",
                          hint: _startTime,
                          widget: IconButton(
                              onPressed: () {
                                getTimeFromUser(isStartTime: true);
                              },
                              icon: const Icon(
                                Icons.access_time_rounded,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: MyInputField(
                          title: "End Date",
                          hint: _endTime,
                          widget: IconButton(
                              onPressed: () {
                                getTimeFromUser(isStartTime: false);
                              },
                              icon: const Icon(
                                Icons.access_time_rounded,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  ),

                  MyInputField(
                    title: "Remind",
                    hint: "$_selectedRemind minutes early",
                    widget: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRemind = int.parse(newValue!);
                        });
                      },
                      items:
                          remindList.map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()));
                      }).toList(),
                    ),
                  ),

                  MyInputField(
                    title: "Repeat",
                    hint: "$selectedRepeat",
                    widget: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedRepeat = newValue!;
                        });
                      },
                      items: repeatList
                          .map<DropdownMenuItem<String>>((String? value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value!,
                              style: const TextStyle(color: Colors.grey),
                            ));
                      }).toList(),
                    ),
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Color",
                            style: titleStyle,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Wrap(
                            children: List<Widget>.generate(3, (int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedColor = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: index == 0
                                        ? const Color(0xFF4e5ae8)
                                        : index == 1
                                            ? const Color(0xFFff4667)
                                            : const Color(0xFFFFB746),
                                    child: _selectedColor == index
                                        ? const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 16,
                                          )
                                        : Container(),
                                  ),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                      MyButton(label: "Create Task", onTap: () => null)
                    ],
                  ),
                ],
              ))),
        ));
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.colorScheme.background,
    );
  }

  getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (_pickerDate != null) {
      _selectedDate = _pickerDate;
    } else {
      print("it's null or something is wrong");
    }
  }

  getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceld");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          // _startTime --> 10:30 AM
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }
}
