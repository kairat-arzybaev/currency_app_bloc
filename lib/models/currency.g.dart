// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      currencyName: json['currencyName'] as String,
      currencyRate: json['currencyRate'] as num,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'currencyName': instance.currencyName,
      'currencyRate': instance.currencyRate,
    };
