import 'package:flutter/material.dart';
import 'complete/complete.dart';
import 'incomplete.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const CompletePage(),
    const IncompletePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Complete',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.close),
              label: 'Incomplete',
            ),
          ],
        ),
      ),
    );
  }
}
