import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(StreakCalendarApp());
}

class StreakCalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: StreakCalendarScreen(),
    );
  }
}

class StreakCalendarScreen extends StatefulWidget {
  @override
  _StreakCalendarScreenState createState() => _StreakCalendarScreenState();
}

class _StreakCalendarScreenState extends State<StreakCalendarScreen> {
  final Map<DateTime, bool> _streakDays = {};
  int _currentStreak = 0;
  int _targetStreak = 30;

  void _toggleDay(DateTime day) {
    setState(() {
      if (_streakDays[day] == true) {
        _streakDays[day] = false;
        _currentStreak = _calculateStreak();
      } else {
        _streakDays[day] = true;
        _currentStreak = _calculateStreak();
      }
    });
  }

  int _calculateStreak() {
    DateTime today = DateTime.now();
    int streak = 0;

    for (int i = 0; i <= _streakDays.keys.length; i++) {
      DateTime day = today.subtract(Duration(days: i));
      if (_streakDays[day] == true) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  void _restartStreak() {
    setState(() {
      _streakDays.clear();
      _currentStreak = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Streak Tracker"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoCard(
                    "CURRENT STREAK", "$_currentStreak Days", Colors.orange),
                _buildInfoCard("TARGET", "$_targetStreak Days", Colors.green),
              ],
            ),
          ),
          Expanded(
            child: TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              selectedDayPredicate: (day) => _streakDays[day] == true,
              onDaySelected: (selectedDay, focusedDay) =>
                  _toggleDay(selectedDay),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.green.shade300,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _restartStreak,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text("Restart Streak"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

