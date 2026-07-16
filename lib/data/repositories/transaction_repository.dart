import 'package:finjoy/core/services/api_service.dart';
import 'package:finjoy/data/models/transaction_model.dart';

class TransactionRepository {
 final ApiService apiService;

 TransactionRepository(this.apiService);

 Future<List<TransactionModel>> getAllTransactions() async {
  final data = await apiService.get("/transactions");
  return (data as List)
  .map((json) => TransactionModel.fromJson(json))
  .toList();
 }

 Future<void> addTransaction(TransactionModel transaction) async {
  await apiService.post('/transactions', {
    'type': transaction. type,
    'amount': transaction.amount,
    'category': transaction.category,
    'note': transaction.note,
  });
 }

 Future<void> deleteTransaction(String id) async {
  await apiService.delete('/transactions/$id');
 }
}
