import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/transaction_model.dart';
import '../../../data/repositories/transaction_repository.dart';

// States
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionModel> transactions;
  TransactionLoaded(this.transactions);
}

// Cubit
class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository repository;

  TransactionCubit(this.repository) : super(TransactionInitial());

  Future<void> loadTransactions() async {
    final transactions = await repository.getAllTransactions();
    emit(TransactionLoaded(transactions));
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    await repository.addTransaction(transaction);
    await loadTransactions();
  }

  Future<void> deleteTransaction(String id) async {
    await repository.deleteTransaction(id);
    await loadTransactions();
  }
}