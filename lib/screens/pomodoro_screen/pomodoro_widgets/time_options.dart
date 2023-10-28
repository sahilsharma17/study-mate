import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/screens/pomodoro_screen/timer_service.dart';
import 'package:study_buddy/screens/pomodoro_screen/utils.dart';

class TimerOptions extends StatelessWidget {
  TimerOptions({super.key});

  
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 240),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap:()=>provider.selectTime(double.parse(time)),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: (70),
              height: (50),
              decoration: int.parse(time)==provider.selectedTime? BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ):BoxDecoration(
                border: Border.all(width: 3, color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  (int.parse(time) ~/ 60).toString(),
                  style: textStyle(
                      Size: 25.0,
                      color: int.parse(time)==provider.selectedTime?renderColor(provider.currentState):Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
