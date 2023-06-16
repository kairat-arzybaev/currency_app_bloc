import 'package:flutter/material.dart';

class CurrencyDetailPage extends StatefulWidget {
  const CurrencyDetailPage({
    Key? key,
    required this.currencyName,
    required this.currencyRate,
  }) : super(key: key);
  final String currencyName;
  final num currencyRate;

  @override
  State<CurrencyDetailPage> createState() => _CurrencyDetailPageState();
}

class _CurrencyDetailPageState extends State<CurrencyDetailPage> {
  final TextEditingController _controller = TextEditingController(text: '1');
  num result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currencyName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                onChanged: (amount) => setState(() {
                  result = double.parse(amount) * widget.currencyRate;
                }),
              ),
            ),
            Text(
              widget.currencyRate.toStringAsFixed(2),
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              result.toStringAsFixed(2),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
