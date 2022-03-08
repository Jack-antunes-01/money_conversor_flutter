import 'package:flutter/material.dart';
import 'package:money_conversion/app/models/currency_model.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController() {
    _getCurrenciesFromModel();
  }

  void _getCurrenciesFromModel() {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(",", ".")) ?? 1.0;

    double returnValue = 0;

    if (fromCurrency.name == "Real") {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == "Dólar") {
      returnValue = value * toCurrency.dollar;
    } else if (fromCurrency.name == "Euro") {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.name == "Bitcoin") {
      returnValue = value * toCurrency.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
