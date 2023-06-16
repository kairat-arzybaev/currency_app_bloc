import 'package:currency_app_bloc/pages/home_page.dart';
import 'package:currency_app_bloc/repos/currency_repository.dart';
import 'package:currency_app_bloc/bloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CurrencyRepository(),
      child: BlocProvider(
        create: (context) =>
            CurrencyBloc(RepositoryProvider.of<CurrencyRepository>(context))
              ..add(FetchCurrencies()),
        child: const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
