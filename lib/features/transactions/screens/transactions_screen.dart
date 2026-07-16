import 'package:finjoy/features/transactions/cubit/transaction_cubit.dart';
import 'package:finjoy/data/models/transaction_model.dart';
import 'package:finjoy/features/dashboard/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        elevation: 0,
        title: const Text(
          'Transactions',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          List<TransactionModel> transactions = [];
          if (state is TransactionLoaded) {
            transactions = state.transactions;
          }

          // Filter logic
          List<TransactionModel> filtered = transactions;
          if (_filter == 'Income') {
            filtered = transactions.where((t) => t.type == 'income').toList();
          } else if (_filter == 'Expense') {
            filtered = transactions.where((t) => t.type == 'expense').toList();
          }

          return Column(
            children: [
              // Filter Chips
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: ['All', 'Income', 'Expense'].map((filter) {
                    final isSelected = _filter == filter;
                    return GestureDetector(
                      onTap: () => setState(() => _filter = filter),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF7C6FFF)
                              : const Color(0xFF1A1A2E),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filter,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Transactions List
              Expanded(
                child: filtered.isEmpty
                    ? const Center(
                        child: Text(
                          'No transactions yet',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final t = filtered[index];
                          return TransactionItem(
                            title: t.note ?? t.category ?? 'Transaction',
                            subtitle: t.category ?? '',
                            amount:
                                '${t.type == 'income' ? '+' : '-'}₹${t.amount.toStringAsFixed(2)}',
                            color: t.type == 'income' ? Colors.green : Colors.red,
                            onDelete: () {
                              context
                                  .read<TransactionCubit>()
                                  .deleteTransaction(t.id!);
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
