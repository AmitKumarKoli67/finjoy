import 'package:finjoy/data/models/transaction_model.dart';
import 'package:hive/hive.dart';

class TransactionRepository {
  static const String boxName = 'transactions';

  Future<Box<TransactionModel>> get _box async =>
      Hive.box<TransactionModel>(boxName);

  Future<List<TransactionModel>> getAllTransactions() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    final box = await _box;
    await box.put(transaction.id, transaction);
  }

  Future<void> deleteTransaction(String id) async {
    final box = await _box;
    await box.delete(id);
  }
}
