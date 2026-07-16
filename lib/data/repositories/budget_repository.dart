import 'package:finjoy/core/services/api_service.dart';
import 'package:finjoy/data/models/budget_model.dart';

class BudgetRepository {
  final ApiService apiService;

  BudgetRepository(this.apiService);

  Future<List<BudgetModel>> getAllBudgets() async {
    final data = await apiService.get('/budgets');
    return (data as List).map((json) => BudgetModel.fromJson(json)).toList();
  }

  Future<void> addBudget(String category, double limit, String period) async {
    await apiService.post('/budgets', {
      'category': category,
      'limit': limit,
      'period': period,
    });
  }
}