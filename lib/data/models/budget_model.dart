import 'package:json_annotation/json_annotation.dart';

part 'budget_model.g.dart';

@JsonSerializable()
class BudgetModel {
  @JsonKey(name: '_id')
  final String? id;

  final String category;

  final double limit;
  final String? period;
  final double? spent;
  final double? remaining;

  BudgetModel({
    this.id,
    required this.category,
    required this.limit,
    this.period,
    this.spent,
    this.remaining,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) => _$BudgetModelFromJson(json);
  Map<String, dynamic> toJson() => _$BudgetModelToJson(this);
}