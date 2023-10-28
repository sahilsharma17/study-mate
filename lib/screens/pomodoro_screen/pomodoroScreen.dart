import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/screens/pomodoro_screen/pomodoro_widgets/progress_widget.dart';
import 'package:study_buddy/screens/pomodoro_screen/pomodoro_widgets/time_options.dart';
import 'package:study_buddy/screens/pomodoro_screen/pomodoro_widgets/timer_card.dart';
import 'package:study_buddy/screens/pomodoro_screen/timer_service.dart';
import 'package:study_buddy/screens/pomodoro_screen/utils.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        // backgroundColor: renderColor(provider.currentState),
        title: Text(
          "Pomotimer",
          // style: textStyle(25.0, Colors.black, FontWeight.w700),

          style: textStyle(
              Size: 25.0, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.refresh,
        //       color: Colors.black,
        //     ),
        //     iconSize: 40,
        //     onPressed: () =>
        //         Provider.of<TimerService>(context, listen: false).reset(),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 20),
            TimerCard(),
            SizedBox(
              height: 40,
            ),
            TimerOptions(),
            SizedBox(
              height: 30,
            ),
            // TimeController(),
            SizedBox(
              height: 30,
            ),
            ProgressWidget(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: provider.timerPlaying
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow_sharp),
                  color: Colors.black,
                  iconSize: 55,
                  onPressed: () {
                    provider.timerPlaying
                        ? Provider.of<TimerService>(context, listen: false)
                            .pause()
                        : Provider.of<TimerService>(context, listen: false)
                            .start();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                  iconSize: 40,
                  onPressed: () =>
                      Provider.of<TimerService>(context, listen: false).reset(),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
