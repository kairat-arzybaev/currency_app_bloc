import 'package:currency_app_bloc/bloc/currency_bloc.dart';
import 'package:currency_app_bloc/pages/currency_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCurrency = 'USD';
  
  final List<DropdownMenuItem<String>> _items =
      ['USD', 'EUR', 'RUB'].map((currency) {
    return DropdownMenuItem<String>(
      value: currency,
      child: Text(currency),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exchange Rates'),
        actions: [
          Container(
            padding: const EdgeInsets.only(left: 15),
            color: Colors.deepOrange,
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(16),
              padding: const EdgeInsets.only(right: 10),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
              dropdownColor: Colors.deepOrange,
              iconEnabledColor: Colors.white,
              value: _selectedCurrency,
              items: _items,
              onChanged: (value) {
                setState(() {
                  _selectedCurrency = value!;
                });
                BlocProvider.of<CurrencyBloc>(context)
                    .add(CurrencyChanged(value!));
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CurrencyLoaded) {
            final currencies = state.currencies;

            return ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                  child: ListTile(
                      tileColor: Colors.amber[300],
                      title: Text(currency.currencyName),
                      subtitle: Text(currency.currencyRate.toStringAsFixed(2)),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CurrencyDetailPage(
                              currencyName: currency.currencyName,
                              currencyRate: currency.currencyRate)))),
                );
              },
            );
          }

          if (state is CurrencyError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
