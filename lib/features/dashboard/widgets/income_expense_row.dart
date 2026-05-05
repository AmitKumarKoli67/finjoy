import 'package:flutter/material.dart';

class IncomeExpenseRow extends StatelessWidget {
  final String income;
  final String expense;

  const IncomeExpenseRow({super.key, required this.income, required this.expense, });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_downward, color: Colors.green),
                SizedBox(height: 8),
                Text(
                  'Income',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  '+₹8,400',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_upward, color: Colors.red),
                SizedBox(height: 8),
                Text(
                  'Expense',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  '-₹3,120',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
