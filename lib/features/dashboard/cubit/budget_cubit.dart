import 'package:finjoy/data/models/budget_model.dart';
import 'package:finjoy/data/repositories/budget_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BudgetState {}

class BudgetInitial extends BudgetState {}

class BudgetLoading extends BudgetState {}

class BudgetLoaded extends BudgetState {
  final List<BudgetModel> budgets;
  BudgetLoaded(this.budgets);
}

class BudgetError extends BudgetState {
  final String message;
  BudgetError(this.message);
}

class BudgetCubit extends Cubit<BudgetState> {
  final BudgetRepository repository;

  BudgetCubit(this.repository) : super(BudgetInitial());

  Future<void> loadBudgets() async {
    emit(BudgetLoading());
    try {
      final budgets = await repository.getAllBudgets();
      emit(BudgetLoaded(budgets));
    } catch (e) {
      emit(BudgetError(e.toString()));
    }
  }

  Future<void> addBudget(String category, double limit, String period) async {
    try {
      await repository.addBudget(category, limit, period);
      await loadBudgets();
    } catch (e) {
      emit(BudgetError(e.toString()));
    }
  }
}
