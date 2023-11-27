import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/screens/pomodoro_screen/timer_service.dart';
import 'package:study_buddy/screens/pomodoro_screen/utils.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({Key? key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;

    return Column(
      children: [
        Container(
          width: 400,
          color: renderColor(provider.currentState),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              provider.currentState,
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimeContainer(
              context,
              (provider.currentDuration ~/ 60).toString(),
              Colors.deepPurple,
              Colors.purple,
            ),
            const SizedBox(width: 10),
            Text(
              ":",
              style: TextStyle(
                fontSize: 60.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            _buildTimeContainer(
              context,
              seconds == 0 ? "${seconds.round()}0" : seconds.round().toString(),
              Colors.deepPurple,
              Colors.purple,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeContainer(
    BuildContext context,
    String text,
    Color startColor,
    Color endColor,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.2,
      height: 170,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [startColor, endColor],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: startColor.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 70.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
