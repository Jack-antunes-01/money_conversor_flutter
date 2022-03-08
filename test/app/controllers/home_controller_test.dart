import 'package:flutter_test/flutter_test.dart';
import 'package:money_conversion/app/controllers/home_controller.dart';
import 'package:money_conversion/app/models/currency_model.dart';

void main() {
  final HomeController homeController = HomeController();

  test("should be able to convert from real to dollar com vírgula", () {
    homeController.toText.text = '2,0';

    homeController.convert();
    expect(homeController.fromText.text, '0.36');
  });

  test("should be able to convert from real to dollar com ponto", () {
    homeController.toText.text = '2.0';

    homeController.convert();
    expect(homeController.fromText.text, '0.36');
  });

  test("should be able to convert from dollar to real", () {
    homeController.toText.text = '1';

    homeController.toCurrency = CurrencyModel(
      name: 'Dólar',
      real: 5.65,
      dollar: 1.0,
      euro: 0.85,
      bitcoin: 0.000088,
    );

    homeController.fromCurrency = CurrencyModel(
      name: 'Real',
      real: 1.0,
      dollar: 0.18,
      euro: 0.15,
      bitcoin: 0.000016,
    );

    homeController.convert();
    expect(homeController.fromText.text, '5.65');
  });
}
