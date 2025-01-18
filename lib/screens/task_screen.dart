import 'package:flutter/material.dart';
class DailyTaskScreen extends StatefulWidget {
  @override
  _DailyTaskScreenState createState() => _DailyTaskScreenState();
}

class _DailyTaskScreenState extends State<DailyTaskScreen> {
  int completedTasks = 1;
  int totalTasks = 5;
  List<bool> taskStatus = List.generate(5, (index) => false);

  List<String> tasks = [
    'Meditate for 20 minutes',
    'Run 2 kilometer',
    'Workout for 10 minutes',
    'Read 5 pages of any book',
    'Watch any recommended videos'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.lightGreenAccent[100], // Mint green background
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Container(
              width: 320,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Daily Goals',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Task Completed $completedTasks/$totalTasks',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: List.generate(
                tasks.length,
                    (index) => Column(
                  children: [
                    TaskBox(
                      text: tasks[index],
                      isCompleted: taskStatus[index],
                      onChanged: (bool? value) {
                        setState(() {
                          taskStatus[index] = value ?? false;
                          completedTasks = taskStatus.where((status) => status).length;
                        });
                      },
                    ),
                    SizedBox(height: 16), // Vertical gap between tasks
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskBox extends StatelessWidget {
  final String text;
  final bool isCompleted;
  final Function(bool?) onChanged;

  const TaskBox({
    Key? key,
    required this.text,
    required this.isCompleted,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: EdgeInsets.fromLTRB(16, 16, 32, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(width: 8),
          Checkbox(
            value: isCompleted,
            onChanged: onChanged,
            activeColor: Color(0xFF2E7D32),
          ),
        ],
      ),
    );
  }
}