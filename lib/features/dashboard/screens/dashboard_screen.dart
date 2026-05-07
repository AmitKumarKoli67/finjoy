import 'package:finjoy/features/dashboard/widgets/balance_card.dart';
import 'package:finjoy/features/dashboard/widgets/income_expense_row.dart';
import 'package:finjoy/features/dashboard/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        elevation: 0,
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF7C6FFF),
          child: Text('A', style: TextStyle(color: Colors.white)),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey Amit 👋',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              'Good Morning',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            BalanceCard(balance: '₹42,850.00'),

            const SizedBox(height: 16),

            // Income and Expense Row
            IncomeExpenseRow(income: '+₹8,400', expense: '-₹3,120'),

            const SizedBox(height: 24),

            // Recent Transactions
            const Text(
              'Recent Transactions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Transaction Items
            TransactionItem(
              title: 'Grocery Store',
              subtitle: 'Food',
              amount: '-₹120',
              color: Colors.red,
            ),
            TransactionItem(
              title: 'Monthly Rent',
              subtitle: 'Housing',
              amount: '-₹2,100',
              color: Colors.red,
            ),
            TransactionItem(
              title: 'Salary',
              subtitle: 'Income',
              amount: '+₹6,500',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
