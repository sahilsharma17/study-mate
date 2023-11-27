import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/controllers/theme_provider.dart';
import 'package:study_buddy/controllers/todo_provider.dart';
import 'package:study_buddy/screens/session_screen/utils/session_utils.dart';


class AllTaskHeader extends StatelessWidget {
  final TodoProvider todoProvider;
  const AllTaskHeader({super.key, required this.todoProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 8.0,
            animation: true,
            percent: todoProvider.calculateCompletedPercentage(
                    todoProvider.totalCompletedTodos(true),
                    todoProvider.todos!.length) /
                100,
            center: Text(
              "${todoProvider.calculateCompletedPercentage(todoProvider.totalCompletedTodos(true), todoProvider.todos!.length)} %",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 12.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Tasks",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "${todoProvider.totalCompletedTodos(true)} of ${todoProvider.todos!.length} task completed",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const Spacer(),
          // Consumer<ThemeProvider>(builder: (context, theme, child) {
          //   return IconButton(
          //     onPressed: () {
          //       WidgetsBinding.instance.addPostFrameCallback((_) {
          //         theme.toggleTheme();
          //       });
          //     },
          //     icon: theme.darkTheme == true
          //         ? const Icon(Icons.dark_mode)
          //         : const Icon(Icons.light_mode, color: Colors.amber),
          //   );
          // }),
      
          IconButton(
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showAlertDialog(
                    context: context,
                    title: "Confirm Delete",
                    content: "Do you wanna delete all the tasks?",
                    onOk: () {
                      todoProvider.deleteAllTodos();
                    });
              });
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
