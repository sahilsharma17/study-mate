import 'package:flutter/material.dart';
// import 'package:pomodoro/timerservise.dart';
// import 'package:pomodoro/utils.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/screens/pomodoro_screen/timer_service.dart';
import 'package:study_buddy/screens/pomodoro_screen/utils.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds=provider.currentDuration%60;
    return Column(
      children: [
        Text(
          provider.currentState,
          style: textStyle(
            Size: 35.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: renderColor(provider.currentState).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 2))
                ],
              ),
              child: Center(
                  child: Text(
                (provider.currentDuration ~/ 60).toString(),
                style: textStyle(
                  Size: 70.0,
                  color: Colors.black,
                  // color: renderColor(provider.currentState),
                  fontWeight: FontWeight.w500,
                ),
              )),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(
                Size: 60.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: renderColor(provider.currentState).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset:const Offset(0, 2))
                ],
              ),
              child: Center(
                  child: Text(
                  seconds==0?"${seconds.round()}0":  
                seconds.round().toString(),
                style: textStyle(
                  Size: 70.0,
                  color: Colors.black,
                  // color: renderColor(provider.currentState),
                  fontWeight: FontWeight.w500,
                ),
              )),
            ),
          ],
        )
      ],
    );
  }
}
