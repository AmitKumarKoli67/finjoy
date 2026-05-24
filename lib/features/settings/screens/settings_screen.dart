import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF7C6FFF),
                    radius: 30,
                    child: Text(
                      'A',
                      style:
                          TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amit Kumar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text('Flutter Developer',
                          style: TextStyle(
                              color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text('Preferences',
                style: TextStyle(color: Colors.grey, fontSize: 12)),

            const SizedBox(height: 12),

            // Dark Mode Toggle
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.dark_mode, color: Color(0xFF7C6FFF)),
                      SizedBox(width: 12),
                      Text('Dark Mode',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Switch(
                    value: _isDarkMode,
                    onChanged: (value) {
                      setState(() => _isDarkMode = value);
                    },
                    activeColor: const Color(0xFF7C6FFF),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Currency
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.currency_rupee,
                          color: Color(0xFF7C6FFF)),
                      SizedBox(width: 12),
                      Text('Currency',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Text('INR (₹)',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text('Data',
                style: TextStyle(color: Colors.grey, fontSize: 12)),

            const SizedBox(height: 12),

            // Clear Data
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: const Color(0xFF1A1A2E),
                    title: const Text('Clear All Data',
                        style: TextStyle(color: Colors.white)),
                    content: const Text(
                        'This will delete all transactions. Are you sure?',
                        style: TextStyle(color: Colors.grey)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel',
                            style: TextStyle(color: Colors.grey)),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Clear',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.delete_outline, color: Colors.red),
                    SizedBox(width: 12),
                    Text('Clear All Data',
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Version
            const Center(
              child: Text('Finjoy v1.0.0',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}