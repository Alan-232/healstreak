import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WatchPage(),
    );
  }
}

class WatchPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      "title": "A simple way to break a bad habit",
      "source": "TED",
      "link": "watch it in youtube",
      "icon": "youtube",
    },
    {
      "title": "Does addiction last a lifetime",
      "source": "Harvard",
      "link": "open in browser",
      "icon": "browser",
    },
    {
      "title": "The Science Of Addiction",
      "source": "TED",
      "link": "watch it in youtube",
      "icon": "youtube",
    },
    {
      "title": "Never enough! The science of addiction",
      "source": "TED",
      "link": "open in browser",
      "icon": "browser",
    },
    {
      "title": "Biology of addiction",
      "source": "newsinhealth",
      "link": "watch it in youtube",
      "icon": "youtube",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header
            Text(
              'WHAT TO WATCH?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            // Video List
            Expanded(
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title and Source
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    video['title']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    video['source']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    video['link']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Icon
                            Icon(
                              video['icon'] == 'youtube' ? Icons.play_circle_fill : Icons.link,
                              color: video['icon'] == 'youtube' ? Colors.red : Colors.grey,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.loop),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
