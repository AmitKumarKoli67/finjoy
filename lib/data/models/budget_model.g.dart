// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) => BudgetModel(
      id: json['_id'] as String?,
      category: json['category'] as String,
      limit: (json['limit'] as num).toDouble(),
      period: json['period'] as String?,
      spent: (json['spent'] as num?)?.toDouble(),
      remaining: (json['remaining'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BudgetModelToJson(BudgetModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'limit': instance.limit,
      'period': instance.period,
      'spent': instance.spent,
      'remaining': instance.remaining,
    };
