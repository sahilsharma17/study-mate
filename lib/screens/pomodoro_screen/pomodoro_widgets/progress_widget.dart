import 'package:flutter/material.dart';
// import 'package:pomodoro/timerservise.dart';
// import 'package:pomodoro/utils.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/screens/pomodoro_screen/timer_service.dart';
import 'package:study_buddy/screens/pomodoro_screen/utils.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
   final  provider=Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4",
              style: textStyle(
                Size: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${provider.goal}/12",
              style: textStyle(
                Size: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "ROUND",
              style: textStyle(
                Size: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "GOAL",
              style: textStyle(
                Size: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )

      ],
    );
  }
}
