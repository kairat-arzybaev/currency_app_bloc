import 'package:currency_app_bloc/models/currency.dart';
import 'package:dio/dio.dart';

class CurrencyRepository {
  Future<List<Currency>> fetchCurrencies(String baseCurrency) async {
    String uri = 'https://api.exchangerate.host/latest?base=$baseCurrency';

    try {
      final response = await Dio().get(uri);

      final Map<String, dynamic> data = response.data['rates'];
      final List<Currency> currencies = [];

      data.forEach((key, value) {
        final currency =
            Currency.fromJson({'currencyName': key, 'currencyRate': value});
        currencies.add(currency);
      });

      return currencies;
    } catch (e) {
      throw Exception('Error fetching currencies: $e');
    }
  }
}
