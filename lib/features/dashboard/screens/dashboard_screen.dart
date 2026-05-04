import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D1A),
      appBar: AppBar(
        title: Text('Hey Amit 👋'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Text(
          'DashboardScreen',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
