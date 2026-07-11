import 'package:flutter/material.dart';

class IncomeExpenseRow extends StatelessWidget {
  final String income;
  final String expense;

  const IncomeExpenseRow({
    super.key,
    required this.income,
    required this.expense,
  });

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.arrow_downward, color: Colors.green),
                const SizedBox(height: 8),
                const Text(
                  'Income',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  income, // ← using parameter now
                  style: const TextStyle(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.arrow_upward, color: Colors.red),
                const SizedBox(height: 8),
                const Text(
                  'Expense',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  expense,
                  style: const TextStyle(
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
