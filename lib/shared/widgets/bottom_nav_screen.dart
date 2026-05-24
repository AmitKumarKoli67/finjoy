import 'package:finjoy/features/settings/screens/settings_screen.dart';
import 'package:finjoy/features/transactions/screens/add_transaction_screen.dart';
import 'package:finjoy/features/transactions/screens/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:finjoy/features/dashboard/screens/dashboard_screen.dart';
// import other screens later

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    const Placeholder(), // Add
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1A2E),
        selectedItemColor: const Color(0xFF7C6FFF),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
            ).then((_) {
              // refresh dashboard when coming back
              setState(() {});
            });
          } else {
            setState(() => _currentIndex = index);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
