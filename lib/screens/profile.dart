import 'package:flutter/material.dart';
import 'package:healstreak/screens/task_screen.dart';


class ProfilePage extends StatelessWidget {
  final String name;
  final int age;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User Details Container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.teal),
              ),
              child: Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.teal,
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // User Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#$name",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "AGE: $age",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Text(
                        "STREAK: 25",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => DailyTaskScreen()),);},
             child: Text('Daily Task')),

            // Helpline Hub Container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.teal),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "HELP LINE HUB",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Helpline entries
                  _buildHelplineEntry(
                    name: "Dr. Alen P Raju",
                    specialization: "Psychologist",
                    phone: "9824434362",
                  ),
                  const SizedBox(height: 8.0),
                  _buildHelplineEntry(
                    name: "Dr. Alan",
                    specialization: "Psychologist",
                    phone: "9865943562",
                  ),
                  const SizedBox(height: 8.0),
                  _buildHelplineEntry(
                    name: "Dr. Tom Sabu",
                    specialization: "Psychologist",
                    phone: "9865843562",
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to create each helpline entry
  Widget _buildHelplineEntry({
    required String name,
    required String specialization,
    required String phone,
  }) {
    return Row(
      children: [
        const Icon(
          Icons.person,
          color: Colors.teal,
          size: 36,
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              specialization,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Text(
              "Ph: $phone",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
