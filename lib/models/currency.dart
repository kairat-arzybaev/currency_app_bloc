import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency {
  String currencyName;
  num currencyRate;

  Currency({required this.currencyName, required this.currencyRate});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}



