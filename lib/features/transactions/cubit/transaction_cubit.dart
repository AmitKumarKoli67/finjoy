import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/transaction_model.dart';
import '../../../data/repositories/transaction_repository.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionModel> transactions;
  TransactionLoaded(this.transactions);
}

class TransactionError extends TransactionState {
  final String message;
  TransactionError(this.message);
}

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository repository;

  TransactionCubit(this.repository) : super(TransactionInitial());

  Future<void> loadTransactions() async {
    emit(TransactionLoading());
    try {
      final transactions = await repository.getAllTransactions();
      emit(TransactionLoaded(transactions));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      await repository.addTransaction(transaction);
      await loadTransactions();
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await repository.deleteTransaction(id);
      await loadTransactions();
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }
}
