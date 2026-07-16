import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  @JsonKey(name: '_id')
  final String? id;

  final String type;
  final double amount;
  final String? category;
  final String? note;
  final DateTime? date;

  TransactionModel({
    this.id,
    required this.type,
    required this.amount,
    required this.category,
    this.note,
    this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
