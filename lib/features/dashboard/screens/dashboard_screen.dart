import 'package:finjoy/data/models/transaction_model.dart';
import 'package:finjoy/features/dashboard/widgets/balance_card.dart';
import 'package:finjoy/features/dashboard/widgets/income_expense_row.dart';
import 'package:finjoy/features/dashboard/widgets/transaction_item.dart';
import 'package:finjoy/features/transactions/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionCubit>().loadTransactions();
  }

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
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          List<TransactionModel> transactions = [];
          if (state is TransactionLoaded) {
            transactions = state.transactions;
          }

          double totalBalance = transactions.fold(
            0,
            (sum, t) => t.type == 'income' ? sum + t.amount : sum - t.amount,
          );
          double totalIncome = transactions
              .where((t) => t.type == 'income')
              .fold(0, (sum, t) => sum + t.amount);
          double totalExpense = transactions
              .where((t) => t.type == 'expense')
              .fold(0, (sum, t) => sum + t.amount);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BalanceCard(balance: '₹${totalBalance.toStringAsFixed(2)}'),
                const SizedBox(height: 16),
                IncomeExpenseRow(
                  income: '+₹${totalIncome.toStringAsFixed(2)}',
                  expense: '-₹${totalExpense.toStringAsFixed(2)}',
                ),
                const SizedBox(height: 24),
                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                transactions.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Column(
                            children: [
                              Icon(
                                Icons.receipt_long,
                                color: Colors.grey,
                                size: 48,
                              ),
                              SizedBox(height: 12),
                              Text(
                                'No transactions yet',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Tap + to add your first transaction',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: transactions
                            .map(
                              (t) => TransactionItem(
                                title: t.note ?? t.category ?? 'Transaction',
                                subtitle: t.category ?? '',
                                amount:
                                    '${t.type == 'income' ? '+' : '-'}₹${t.amount.toStringAsFixed(2)}',
                                color: t.type == 'income' ? Colors.green : Colors.red,
                              ),
                            )
                            .toList(),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
