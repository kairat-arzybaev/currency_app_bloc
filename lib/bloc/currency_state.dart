part of 'currency_bloc.dart';

abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  final List<Currency> currencies;

  CurrencyLoaded(this.currencies);
}

class CurrencyError extends CurrencyState {
  final String message;

  CurrencyError(this.message);
}
