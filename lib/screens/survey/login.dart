import 'package:flutter/material.dart';
import 'package:healstreak/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  int? _age;

  void _submitSurvey() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfilePage(name: _name ?? '', age: _age ?? 0),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Colors.white,
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                // Header Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Start your journey with us",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/avatar1.png', // Replace with your asset paths
                            height: 60,
                          ),
                          const SizedBox(width: 16),
                          Image.asset(
                            'assets/avatar2.png',
                            height: 60,
                          ),
                          const SizedBox(width: 16),
                          Image.asset(
                            'assets/avatar3.png',
                            height: 60,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "We're here to support you in every step of the way on "
                            "your journey to recovery. With our guaranteed tools "
                            "and streak-based approach, you're never alone. "
                            "Together, we'll make progress.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Name Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'how you want to be known',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value,
                ),
                const SizedBox(height: 16),

                // Age Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Age',
                    hintText: 'your age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    } else if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) => _age = int.tryParse(value ?? ''),
                ),
                const SizedBox(height: 32),

                // Submit Button
                ElevatedButton(
                  onPressed: _submitSurvey,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Create Profile',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
