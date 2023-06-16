import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currency_app_bloc/models/currency.dart';
import 'package:currency_app_bloc/repos/currency_repository.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository _currencyRepository;
  String _selectedCurrency = 'USD';
  CurrencyBloc(this._currencyRepository) : super(CurrencyInitial()) {
    on<FetchCurrencies>((event, emit) async {
      emit(CurrencyLoading());

      try {
        final currencies =
            await _currencyRepository.fetchCurrencies(_selectedCurrency);
        emit(CurrencyLoaded(currencies));
      } catch (e) {
        emit(CurrencyError(e.toString()));
      }
    });
    on<CurrencyChanged>((event, emit) async {
      _selectedCurrency = event.currency;
      add(FetchCurrencies());
    });
  }
}
