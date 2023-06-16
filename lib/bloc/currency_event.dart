part of 'currency_bloc.dart';

abstract class CurrencyEvent {}

class FetchCurrencies extends CurrencyEvent {}

class CurrencyChanged extends CurrencyEvent {
  final String currency;

  CurrencyChanged(this.currency);
}